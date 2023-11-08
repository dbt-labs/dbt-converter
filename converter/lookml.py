from itertools import takewhile
import os
import lkml
from lkml.tree import (
    BlockNode,
    ContainerNode,
    DocumentNode,
    ListNode,
    PairNode,
    SyntaxNode,
    SyntaxToken,
    Visitor,
)
from typing import Dict, Iterator, List, Optional, Union

from dbt_semantic_interfaces.parsing.dir_to_model import SemanticManifestBuildResult
from dbt_semantic_interfaces.implementations.semantic_model import PydanticSemanticModel
from dbt_semantic_interfaces.implementations.elements.dimension import PydanticDimension
from dbt_semantic_interfaces.type_enums.dimension_type import DimensionType
from dbt_semantic_interfaces.type_enums.aggregation_type import AggregationType
from dbt_semantic_interfaces.implementations.semantic_manifest import (
    PydanticSemanticManifest,
)
from dbt_semantic_interfaces.implementations.semantic_model import NodeRelation
from dbt_semantic_interfaces.implementations.elements.measure import PydanticMeasure
from pydantic import BaseModel


def lookml_to_semantic_manifest(lookml_project_dir: str) -> SemanticManifestBuildResult:
    semantic_models = []
    for path in lookml_file_paths(lookml_project_dir):
        with open(path, "r") as f:
            lookml_model = lkml.load(f)
            # print(json.dumps(lookml_model))
            semantic_model = parse_view2(lookml_model)
            # print(semantic_model)
            semantic_models.extend(semantic_model)
    print(len(semantic_models))
    manifest = PydanticSemanticManifest(semantic_models=semantic_models, metrics=[])
    return SemanticManifestBuildResult(semantic_manifest=manifest)


def lookml_file_paths(lookml_project_dir: str) -> Iterator[str]:
    for dirpath, dnames, fnames in os.walk(lookml_project_dir):
        for f in fnames:
            if f.endswith(".lkml"):
                yield os.path.join(dirpath, f)


class LkmlMeasure(BaseModel):
    name: str
    type: str  # TODO: make this a different type


class LkmlDimension(BaseModel):
    name: str
    type: str  # TODO: make this a different type


class View(BaseModel):
    measures: List[LkmlMeasure]
    dimensions: List[LkmlDimension]


class LookMlModel(BaseModel):
    sql_table_name: str
    views: Optional[List[View]]
    name: str


def load_parse(f):
    lookml_model = lkml.load(f)
    # print(json.dumps(lookml_model))
    return parse_view2(lookml_model)


def parse_view2(lookml_model: LookMlModel) -> List[PydanticSemanticModel]:
    semantic_models = []
    measure_type_map = {
        "zipcode": AggregationType.COUNT,
        "string": AggregationType.COUNT,
        "number": AggregationType.COUNT,  # TODO: sum?
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
    dimension_type_map = {
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
    if "views" not in lookml_model:
        return []
    for view in lookml_model["views"]:
        measures = [
            PydanticMeasure(
                name=m["name"], agg=measure_type_map[m["type"]], create_metric=True
            )
            for m in view["measures"]
        ]
        dimensions = [
            PydanticDimension(name=d["name"], type=dimension_type_map[d["type"]])
            for d in view["dimensions"]
        ]
        alias = get_alias(view["sql_table_name"])
        node_relation = NodeRelation(
            alias=alias,
            schema_name="schema_name",
            database=None,
            relation_name="relation_name",
        )
        entities = []
        semantic_models.append(
            PydanticSemanticModel(
                name=view["name"],
                dimensions=dimensions,
                measures=measures,
                node_relation=node_relation,
                entities=entities,
            )
        )
    manifest = PydanticSemanticManifest(semantic_models=semantic_models, metrics=[])
    return SemanticManifestBuildResult(semantic_manifest=manifest)


def get_alias(sql_table_name: str):
    # Check if this case is similar to
    # https://discourse.getdbt.com/t/looker-user-attributes-and-if-dev-to-auto-switch-between-dev-prod-schemas/54
    if "-- if prod --" in sql_table_name:
        return parse_dev_prod_syntax(sql_table_name)
    return sql_table_name.split(".")[-1]


def parse_dev_prod_syntax(sql_table_name: str):
    # Unfortunately, this pattern isn't documented by Looker,
    # so the parse rules here are unclear

    prod_identifier = "-- if prod -- "
    result = sql_table_name[sql_table_name.index(prod_identifier) :]
    result = result[len(prod_identifier) :]
    result = "".join(takewhile(lambda char: not char.isspace(), result))
    return result.split(".")[-1]
