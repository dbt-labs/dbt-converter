import os
import json
import glob
import ruamel.yaml
from metricflow.model.parsing.dbt_dir_to_model import ModelBuildResult, parse_dbt_project_to_model
from metricflow.model.parsing.dbt_cloud_to_model import model_build_result_for_dbt_cloud_job,get_dbt_cloud_metrics, parse_dbt_cloud_metrics_to_model


#Parsing Steps
#1. Create a model from a dbt project
#2. Create all data source in that model as seperate yaml files name data_source_name.yaml
#3. Create all metrics in a metrics folder called metrics.yaml. Each metric is a seperate yaml document ---

def get_model() -> ModelBuildResult:
    return parse_dbt_project_to_model('/Users/jordanstein/Dev/dbt-converter/dbt_project')

def write_metrics(model: ModelBuildResult):
    # Intialize a new list of metrics
    metric_list = []
    # dump json to yaml for each metic in the model
    for metric in  model.model.metrics:
            with open(f'metrics/{metric.name}.json','w+') as f:
                f.write(metric.json(exclude_defaults=True)) # It would probably be cleaner not to write these files, but i can't figure out how to get the encoding to work :^)
    for filename in glob.glob(f'metrics/*.json'): #iterate over each file name that matches this pattern
        with open(filename,'r') as f:
            metric_list.append(json.load(f))

    with open('metrics.yaml','a') as file:
        ruamel.yaml.dump_all(metric_list,file, Dumper=ruamel.yaml.RoundTripDumper,)
            


def write_semantic_models(model: ModelBuildResult): 
    """
    This function takes in a MetricFlow ModelBuildResult and 
    creates a yaml file for each data source in the ModelBuildResult.
    """
    if model.issues.errors:
         return print("\nPlease fix errors in semantic model and re run the converter")
    for data_source in model.model.data_sources:
        with open(f'config_{data_source.name}.json', 'w') as file:
            file.write(data_source.json(exclude_defaults=True))
        with open(f'config_{data_source.name}.json', 'r') as file:
            configuration = json.load(file)
        with open(f'{data_source.name}.yaml', "w") as file:
            ruamel.yaml.dump(configuration,file, Dumper=ruamel.yaml.RoundTripDumper)
    return "Success! Semantic Models Created"

model = get_model()
write_semantic_models(model)
write_metrics(model)
