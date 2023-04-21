import os
import json
import ruamel.yaml
from metricflow.model.parsing.dir_to_model import ModelBuildResult
from metricflow.model.parsing.dbt_cloud_to_model import model_build_result_for_dbt_cloud_job,get_dbt_cloud_metrics, parse_dbt_cloud_metrics_to_model

dbt_auth = os.environ['DBT_AUTH']

def get_and_convert_metrics(auth: str, job_id: int) -> ModelBuildResult:
    errors_list = []
    print("Getting metrics from Job ID {}".format(job_id))
    metrics = get_dbt_cloud_metrics(auth,job_id)
    print("Converting dbt metrics to UserConfiguredModel")
    semantic_model = parse_dbt_cloud_metrics_to_model(metrics)
    if semantic_model.issues.errors:
        for error in semantic_model.issues.errors:
            errors_list.append(error.dict()['message'])
            print(error.dict()['message'])
        return semantic_model
    else: 
        return semantic_model

def write_semantic_model_yaml(semantic_model: ModelBuildResult, json_file: str, yaml_file: str):
    if semantic_model.issues.errors:
        return print("\nPlease fix errors in semantic model and re run the converter")
    with open(json_file, 'w') as file:
        file.write(semantic_model.model.json(exclude_defaults=True))
    with open(json_file, 'r') as file:
        configuration = json.load(file)
    print("Writing semantic model to {}".format(yaml_file))
    with open(yaml_file, "w") as file:
        ruamel.yaml.dump(configuration,file, Dumper=ruamel.yaml.RoundTripDumper)
    print("\nSuccess! Semantic model written to {}".format(yaml_file))

write_semantic_model_yaml(get_and_convert_metrics(dbt_auth,940),'config.json','config.yaml')

#Test Cloud job ID 221289
# Prod Cloud jon ID 940

# todo: Better error messages, write metrics to seperate yaml, option to write data sources to seperate yaml, auto generate empty identifier key, add formating polish to CLI prompts
# errors = get_and_convert_metrics(dbt_auth,940).issues.errors
# print(errors)
# errors_list = []
# for error in errors:
#     errors_list.append(error.dict()['message'])
#     # print(error.dict()['message'])
# print(errors_list)

