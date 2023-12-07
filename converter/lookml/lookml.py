from itertools import takewhile
import os
import lkml
from typing import Iterator, List, Optional

from dbt_semantic_interfaces.parsing.dir_to_model import SemanticManifestBuildResult
from dbt_semantic_interfaces.implementations.semantic_model import PydanticSemanticModel
from dbt_semantic_interfaces.implementations.semantic_manifest import (
    PydanticSemanticManifest,
)
from dbt_semantic_interfaces.implementations.semantic_model import NodeRelation

from tqdm import tqdm

from converter.lookml.dimension import to_sl_dimensions
from converter.lookml.measure import to_sl_measures
from converter.lookml.model import LookMLModel


def lookml_to_semantic_manifest(lookml_project_dir: str) -> SemanticManifestBuildResult:
    all_semantic_models = []
    for path in tqdm(list(lookml_file_paths(lookml_project_dir))):
        with open(path, "r") as f:
            lookml_model_dict = lkml.load(f)
            lookml_model = LookMLModel.parse_obj(lookml_model_dict)
            semantic_models = parse_model(lookml_model)
            all_semantic_models.extend(semantic_models)
    manifest = PydanticSemanticManifest(semantic_models=all_semantic_models, metrics=[])
    return SemanticManifestBuildResult(semantic_manifest=manifest)


def lookml_file_paths(lookml_project_dir: str) -> Iterator[str]:
    for dirpath, dnames, fnames in os.walk(lookml_project_dir):
        for f in fnames:
            if f.endswith(".lkml"):
                yield os.path.join(dirpath, f)


def parse_model(lookml_model: LookMLModel) -> List[PydanticSemanticModel]:
    semantic_models = []

    if not lookml_model.views:
        return []
    for view in lookml_model.views:
        measures = to_sl_measures(view.measures)
        dimensions = to_sl_dimensions(view.dimensions)
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
    prod_identifier = "-- if prod -- "
    if prod_identifier in sql_table_name:
        return parse_dev_prod_syntax(sql_table_name, prod_identifier)
    return sql_table_name.split(".")[-1]


def parse_dev_prod_syntax(sql_table_name: str, prod_identifier: str):
    # Unfortunately, this pattern isn't documented by Looker,
    # so the parse rules here aren't well defined
    tail = sql_table_name[sql_table_name.index(prod_identifier) :]
    tail = tail[len(prod_identifier) :]
    table_fqn = "".join(takewhile(lambda char: not char.isspace(), tail))
    return table_fqn.split(".")[-1]
