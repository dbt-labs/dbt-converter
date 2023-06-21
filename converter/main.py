from spec_upgrade import to_yaml_mutli_file, MetricFLowConfig
from dbt_metrics_to_semantic_model_converter import get_model, write_semantic_models, write_metrics, delete_json_files

def main():
    model = get_model()
    write_semantic_models(model)
    write_metrics(model)

    delete_json_files('metrics')
    delete_json_files('data_source')
    configs = MetricFLowConfig('/Users/jordanstein/Dev/dbt-converter/semantic_models','/Users/jordanstein/Dev/dbt-converter/metrics')
    to_yaml_mutli_file(config=configs)

if __name__ == "__main__":
    main()