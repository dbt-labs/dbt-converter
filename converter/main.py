from converter.lookml.lookml import lookml_to_semantic_manifest
from converter.manifest_to_project import manifest_to_project
import click
import os

from metricflow_parsing.dbt_dir_to_model import parse_dbt_project_to_model


@click.group(help="Convert projects to dbt Semantic models")
def cli():
    pass


@cli.command(
    help="Given a dbt project path, converts metrics defined in the spec prior to dbt v1.6 to the spec defined in dbt v1.6"
)
@click.option(
    "--dbt-project-path",
    default=os.getcwd(),
    help="Path to dbt project containing models and metrics",
)
def convert_metrics(dbt_project_path: str):
    try:
        model = parse_dbt_project_to_model(dbt_project_path)
    except Exception as e:
        return print(e)
    manifest_to_project(model)


"""
@cli.command(help="Convert a LookML project to the dbt Semantic Layer")
@click.option(
    "--lookml-project-path",
    default=os.getcwd(),
    help="Path to dbt project containing models and metrics",
)
"""


def convert_lookml(lookml_project_dir: str):
    model = lookml_to_semantic_manifest(lookml_project_dir)
    manifest_to_project(model)


if __name__ == "__main__":
    # cli()
    convert_lookml("/Users/devonfulcher/git/looker")
