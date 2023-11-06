import glob
import lkml
import re
from pprint import pformat
from typing import List
from os.path import abspath, dirname, join
import logging
import json

from dbt_semantic_interfaces.parsing.dir_to_model import SemanticManifestBuildResult
from dbt_semantic_interfaces.implementations.semantic_model import PydanticSemanticModel
from dbt_semantic_interfaces.implementations.elements.dimension import PydanticDimension
from dbt_semantic_interfaces.type_enums.dimension_type import DimensionType
from dbt_semantic_interfaces.type_enums.aggregation_type import AggregationType
from dbt_semantic_interfaces.implementations.semantic_manifest import (
    PydanticSemanticManifest,
)
from dbt_semantic_interfaces.implementations.elements.measure import PydanticMeasure


def lookml_to_semantic_manifest(lookml_project_dir: str) -> SemanticManifestBuildResult:
    lookml_model = file_loader(lookml_project_dir)
    print(json.dumps(lookml_model))
    return parse_explores(lookml_model)


def update_namespace(namespace, new_file):
    if namespace is None:
        return new_file
    for key, _ in new_file.items():
        if key in namespace and key in ("views", "explores"):
            namespace[key] = namespace[key] + new_file[key]
        elif key in namespace and key in ("includes"):  # remove duplicates
            namespace[key] = list(set(namespace[key] + new_file[key]))
        elif key in ("views", "explores", "includes"):
            namespace[key] = new_file[key]
        elif key in ("connection"):
            pass  # ignored keys
        else:
            print(f"Key not supported yet: {key}")
    return namespace


def file_loader(file_path_input: str):
    visited_path = {}

    def helper(file_path_input: str, namespace=None):
        file_paths = glob.glob(file_path_input)
        for file_path in file_paths:
            if file_path in visited_path or not file_path.endswith(".lkml"):
                continue
            visited_path[file_path] = True
            lookml_model = lkml.load(open(file_path, "r"))
            if "includes" in lookml_model:
                for included_path in lookml_model["includes"]:
                    if (
                        namespace
                        and "includes" in namespace
                        and included_path in namespace["includes"]
                    ):
                        continue
                    if included_path.startswith("/"):
                        included_path = included_path[1:]
                    root_dir = dirname(abspath(file_path))
                    namespace = helper(
                        join(root_dir, included_path), namespace=namespace
                    )
            namespace = update_namespace(namespace, lookml_model)
        return namespace

    return helper(file_path_input, None)


def parse_view(
    lookml_model, raise_when_views_not_present=True
) -> List[PydanticSemanticModel]:
    semantic_models = []
    # TODO: adjust rpl_table
    rpl_table = lambda s: s.replace("${TABLE}", "{CUBE}").replace("${", "{")
    # TODO: clean up type_map & type_map_2
    type_map = {
        "zipcode": "string",
        "string": "string",
        "number": "number",
        "tier": "number",
        "count": "count",
        "yesno": "boolean",
        "sum": "sum",
        "sum_distinct": "sum",
        "average": "avg",
        "average_distinct": "avg",
        "date": "time",
        "time": "time",
        "count_distinct": "count_distinct_approx",
    }
    type_map_2 = {
        "zipcode": DimensionType.CATEGORICAL,
        "string": DimensionType.CATEGORICAL,
        "number": DimensionType.CATEGORICAL,
        "tier": DimensionType.CATEGORICAL,
        "count": DimensionType.CATEGORICAL,
        "yesno": DimensionType.CATEGORICAL,
        "sum": DimensionType.CATEGORICAL,
        "sum_distinct": DimensionType.CATEGORICAL,
        "average": DimensionType.CATEGORICAL,
        "average_distinct": DimensionType.CATEGORICAL,
        "date": DimensionType.TIME,
        "time": DimensionType.TIME,
        "count_distinct": DimensionType.TIME,
    }
    type_map_3 = {
        "zipcode": AggregationType.COUNT,
        "string": AggregationType.COUNT,
        "number": AggregationType.COUNT,  # sum?
        "tier": AggregationType.COUNT,
        "count": AggregationType.COUNT,
        "yesno": AggregationType.SUM_BOOLEAN,
        "sum": AggregationType.SUM,
        "sum_distinct": AggregationType.SUM,
        "average": AggregationType.AVERAGE,
        "average_distinct": AggregationType.AVERAGE,
        "date": AggregationType.COUNT,
        "time": AggregationType.COUNT,
        "count_distinct": AggregationType.COUNT_DISTINCT,
    }
    sets = {}

    if raise_when_views_not_present and "views" not in lookml_model:
        raise Exception(
            f"The following object types are not implemented yet: {lookml_model.keys()}"
        )
    elif "views" not in lookml_model:
        return []

    for view in lookml_model["views"]:
        try:
            if "sets" in view:
                for set in view["sets"]:
                    sets[set["name"]] = set["fields"]

            """ TODO: like don't need this
            semantic_model_dict = {
                "name": view["name"],
                "dimensions": [],
                "measures": [],
                "joins": [],
            }
            if "sql_table_name" in view:
                semantic_model_dict["sql_table"] = view["sql_table_name"]
            elif "derived_table" in view and "sql" in view["derived_table"]:
                semantic_model_dict["sql"] = view["derived_table"]["sql"]
            else:
                typer.echo(view)
                raise Exception(f"View type not implemented yet")
            """
            dimensions = []
            measures = []
            if "dimensions" not in view:
                logging.warning("Expected dimensions to exist in view.")
                continue

            for dimension in view["dimensions"]:
                if "type" not in dimension:
                    # Defaults to string
                    dimension["type"] = "string"
                if dimension["type"] not in type_map_2:
                    raise Exception(
                        f'Dimension type: {dimension["type"]} not implemented yet:\n {dimension}'
                    )
                sl_dimension = {
                    "name": dimension["name"],
                    "sql": rpl_table(dimension["sql"]),
                    "type": type_map_2[dimension["type"]],
                }
                if dimension["type"] == "tier":
                    bins = dimension["bins"]
                    if len(bins) < 2:
                        pass
                    else:
                        tier_sql = f"CASE "
                        for i in range(0, len(bins) - 1):
                            tier_sql += f" WHEN {sl_dimension['sql']} >= {bins[i]} AND {sl_dimension['sql']} < {bins[i + 1]} THEN {bins[i]} "
                        tier_sql += "ELSE NULL END"
                        sl_dimension["sql"] = tier_sql
                dimensions.append(
                    PydanticDimension(
                        name=sl_dimension["name"],
                        expr=sl_dimension["sql"],
                        type=sl_dimension["type"],
                    )
                )

            if "dimension_groups" in view:
                for dimension in view["dimension_groups"]:
                    sl_dimension = {
                        "name": dimension["name"],
                        "sql": rpl_table(dimension["sql"]),
                        "type": type_map_2[dimension["type"]],
                    }
                    if "type" not in dimension:
                        raise Exception(
                            f'Dimension type: {dimension["type"]} not implemented yet:\n {dimension}'
                        )
                    dimensions.append(
                        PydanticDimension(
                            name=sl_dimension["name"],
                            expr=sl_dimension["sql"],
                            type=sl_dimension["type"],
                        )
                    )

            if "measures" not in view:
                semantic_models.append(
                    PydanticSemanticModel(name=view["name"], dimensions=dimensions)
                )
                continue

            for measure in view["measures"]:
                if measure["type"] not in type_map_3:
                    msg = f'Measure type: {measure["type"]} not implemented yet:\n# {measure}'
                    if measure["type"] in ("list", "sum_distinct"):
                        logging.info(f"# {msg}")
                        continue
                    else:
                        raise Exception(msg)
                sl_measure = {
                    "name": measure["name"],
                    "type": type_map_3[measure["type"]],
                }
                if measure["type"] != "count":
                    sl_measure["sql"] = rpl_table(measure["sql"])
                elif "drill_fields" in measure:
                    drill_members = []
                    for drill_field in measure["drill_fields"]:
                        if "*" in drill_field:
                            drill_field = drill_field.replace("*", "")
                            if drill_field not in sets:
                                logging.warning(f"set undefined {drill_field}")
                            else:
                                drill_members += sets[drill_field]
                        else:
                            drill_members.append(drill_field)
                        sl_measure["drill_members"] = drill_members

                measures.append(
                    PydanticMeasure(
                        name=sl_measure["name"],
                        agg=type_map_3[measure["type"]],
                        create_metric=True,
                    )
                )

            semantic_models.append(
                PydanticSemanticModel(
                    name=view["name"], dimensions=dimensions, measures=measures
                )
            )
        except Exception:
            logging.error(f"Error while parsing view: {pformat(view)}")
    return semantic_models


def snakify(s):
    return "_".join(
        re.sub(
            "([A-Z][a-z]+)", r" \1", re.sub("([A-Z]+)", r" \1", s.replace("-", " "))
        ).split()
    ).lower()


def traverse_graph(join_paths, left, right):
    # Create a queue for BFS
    queue = []
    queue.append([left])

    while queue:
        # Dequeue a vertex from queue
        tmp_path = queue.pop(0)
        # If this adjacent node is the destination node,
        # then return true
        last_node = tmp_path[len(tmp_path) - 1]
        if last_node == right:
            return ".".join(tmp_path)
        #  Else, continue to do BFS
        if last_node in join_paths:
            for node in join_paths[last_node]:
                if node not in tmp_path:
                    new_path = []
                    new_path = tmp_path + [node]
                    queue.append(new_path)

    logging.info(f"Nodes are not reachable: {left}, {right}")
    return ".".join(left, right)


def parse_explores(lookml_model) -> SemanticManifestBuildResult:
    if "explores" not in lookml_model:
        raise Exception(
            "LookML explores are needed to generate dbt Semantic Layer, no explore found in path."
        )
    semantic_models = parse_view(lookml_model, raise_when_views_not_present=False)
    manifest = PydanticSemanticManifest(semantic_models=semantic_models, metrics=[])
    return SemanticManifestBuildResult(semantic_manifest=manifest)
