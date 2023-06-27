from converter.spec_upgrade import MetricFLowConfig, to_yaml_mutli_file
from converter.dbt_metrics_to_semantic_model_converter import write_semantic_models, write_metrics, delete_json_files, get_model
import click
import os

@click.group()
def cli():
    pass

@cli.command()
@click.option('--dbt-project-path', default= os.getcwd(), help='Path to dbt project containing models and metrics')
def convert(dbt_project_path: str):
    # from converter.spec_upgrade import MetricFLowConfig, to_yaml_mutli_file

    try:
        model = get_model(dbt_project_path)
    except Exception as e:
        print(f'{e}. Please check if the path to dbt project is correct: {dbt_project_path}')
        return
    write_semantic_models(model)
    write_metrics(model)

    delete_json_files('metrics')
    delete_json_files('data_source')
    configs = MetricFLowConfig(os.path.join(os.getcwd(),'semantic_models'), os.path.join(os.getcwd(),'metrics'))
    to_yaml_mutli_file(config=configs)


if __name__ == "__main__":
    cli()