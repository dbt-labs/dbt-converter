from converter.spec_upgrade import MetricFLowConfig, to_yaml_mutli_file
from converter.dbt_metrics_to_semantic_model_converter import write_semantic_models, write_metrics, delete_json_files, get_model
import click
import os

@click.group(help='Convert dbt models and metrics to semantic models')
def cli():
    pass

@cli.command(help= 'Given a dbt project path, converts metrics defined in the spec prior to dbt v1.6 to the spec defined in dbt v1.6')
@click.option('--dbt-project-path', default= os.getcwd(), help='Path to dbt project containing models and metrics')
def convert_metrics(dbt_project_path: str):
    try:
        model = get_model(dbt_project_path)
    except Exception as e:
        return print(e)
    write_semantic_models(model)
    write_metrics(model)

    delete_json_files('metrics')
    delete_json_files('data_source')
    configs = MetricFLowConfig(os.path.join(os.getcwd(),'semantic_models'), os.path.join(os.getcwd(),'metrics'))
    to_yaml_mutli_file(config=configs)


if __name__ == "__main__":
    cli()