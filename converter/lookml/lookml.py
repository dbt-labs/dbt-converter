from itertools import takewhile
import os
import lkml
from typing import Iterator, List, Optional, Tuple

from dbt_semantic_interfaces.parsing.dir_to_model import SemanticManifestBuildResult
from dbt_semantic_interfaces.implementations.semantic_model import PydanticSemanticModel
from dbt_semantic_interfaces.type_enums.time_granularity import TimeGranularity
from dbt_semantic_interfaces.implementations.elements.dimension import (
    PydanticDimension,
)
from dbt_semantic_interfaces.type_enums.aggregation_type import AggregationType
from dbt_semantic_interfaces.implementations.semantic_manifest import (
    PydanticSemanticManifest,
)
from dbt_semantic_interfaces.implementations.semantic_model import NodeRelation
from dbt_semantic_interfaces.implementations.elements.measure import PydanticMeasure
from pydantic import BaseModel

from converter.lookml.dimension import LkmlDimension, get_dimension_type

DEFAULT_TIME_GRANULARITY = TimeGranularity.DAY


def lookml_to_semantic_manifest(lookml_project_dir: str) -> SemanticManifestBuildResult:
    semantic_models = []
    for path in lookml_file_paths(lookml_project_dir):
        with open(path, "r") as f:
            lookml_model_dict = lkml.load(f)
            lookml_model = LkmlModel.parse_obj(lookml_model_dict)
            semantic_model = parse_model(lookml_model)
            semantic_models.extend(semantic_model)
    manifest = PydanticSemanticManifest(semantic_models=semantic_models, metrics=[])
    return SemanticManifestBuildResult(semantic_manifest=manifest)


def lookml_file_paths(lookml_project_dir: str) -> Iterator[str]:
    for dirpath, dnames, fnames in os.walk(lookml_project_dir):
        for f in fnames:
            if f.endswith(".lkml"):
                yield os.path.join(dirpath, f)


class LkmlMeasure(BaseModel):
    name: str
    type: Optional[str]  # TODO: make this a different type


class LkmlView(BaseModel):
    sql_table_name: Optional[str]
    name: str
    measures: Optional[List[LkmlMeasure]]
    dimensions: List[LkmlDimension]


class LkmlModel(BaseModel):
    views: Optional[List[LkmlView]]


def parse_model(lookml_model: LkmlModel) -> List[PydanticSemanticModel]:
    semantic_models = []
    measure_type_map = {
        "average": AggregationType.AVERAGE,
        "average_distinct": AggregationType.AVERAGE,
        "count": AggregationType.COUNT,
        "count_distinct": AggregationType.COUNT_DISTINCT,
        "date": AggregationType.COUNT,
        "list": AggregationType.COUNT,
        "max": AggregationType.MAX,
        "median": AggregationType.MEDIAN,
        "median_distinct": AggregationType.MEDIAN,
        "min": AggregationType.MIN,
        "number": AggregationType.COUNT,  # TODO: sum?
        "percent_of_previous": AggregationType.PERCENTILE,
        "percent_of_total": AggregationType.PERCENTILE,
        "percentile": AggregationType.PERCENTILE,
        "percentile_distinct": AggregationType.PERCENTILE,
        "running_total": AggregationType.SUM,
        "string": AggregationType.COUNT,
        "sum": AggregationType.SUM,
        "sum_distinct": AggregationType.SUM,
        "yesno": AggregationType.SUM_BOOLEAN,
        "int": AggregationType.COUNT,
    }

    if not lookml_model.views:
        return []
    for view in lookml_model.views:
        measures = []
        for measure in view.measures or []:
            if not measure.type:
                continue
            measures.append(
                PydanticMeasure(
                    name=measure.name,
                    agg=measure_type_map[measure.type],
                    create_metric=True,
                )
            )
        dimensions = []
        for dimension in view.dimensions:
            if not dimension.type:
                continue
            dim_type, dim_type_param = get_dimension_type(dimension)
            dimensions.append(
                PydanticDimension(
                    name=dimension.name,
                    type=dim_type,
                    type_params=dim_type_param,
                )
            )
        alias = get_alias(view.sql_table_name)
        node_relation = NodeRelation(
            alias=alias,
            schema_name="schema_name",
            database=None,
            relation_name="relation_name",
        )
        entities = []
        semantic_models.append(
            PydanticSemanticModel(
                name=view.name,
                dimensions=dimensions,
                measures=measures,
                node_relation=node_relation,
                entities=entities,
            )
        )
    return semantic_models


def get_alias(sql_table_name: Optional[str]) -> str:
    if not sql_table_name:
        return ""
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
