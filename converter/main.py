from converter.spec_upgrade import MetricFLowConfig, to_yaml_mutli_file
from converter.dbt_metrics_to_semantic_model_converter import write_semantic_models, write_metrics, delete_json_files, get_model

def main():
    model = get_model('test_dbt_project')
    write_semantic_models(model)
    write_metrics(model)

    delete_json_files('metrics')
    delete_json_files('data_source')
    configs = MetricFLowConfig('/Users/jordanstein/Dev/dbt-converter/semantic_models','/Users/jordanstein/Dev/dbt-converter/metrics')
    to_yaml_mutli_file(config=configs)

if __name__ == "__main__":
    main()