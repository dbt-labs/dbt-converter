import os
import json
import glob
import ruamel.yaml
from dbt_semantic_interfaces.parsing.dir_to_model import SemanticManifestBuildResult
from metricflow_parsing.dbt_dir_to_model import parse_dbt_project_to_model



#Parsing Steps
#1. Create a model from a dbt project
#2. Create all data source in that model as seperate yaml files name data_source_name.yaml
#3. Create all metrics in a metrics folder called metrics.yaml. Each metric is a seperate yaml document ---

def get_model(dbt_project_dir: str) -> SemanticManifestBuildResult:
    return parse_dbt_project_to_model(dbt_project_dir)

def write_metrics(model: SemanticManifestBuildResult):

    if os.path.exists('metrics'):
        os.system('rm -rf metrics')
        os.mkdir('metrics')
    else:
        os.mkdir('metrics')

    # Intialize a new list of metrics
    metric_list = []
    # dump json to yaml for each metic in the model
    for metric in  model.semantic_manifest.metrics:
            with open(f'metrics/{metric.name}.json','w+') as f:
                f.write(metric.json(exclude_defaults=True)) # It would probably be cleaner not to write these files, but i can't figure out how to get the encoding to work :^)
    for filename in glob.glob(f'metrics/*.json'): #iterate over each file name that matches this pattern
        with open(filename,'r') as f:
            metric_list.append(json.load(f))

    with open('metrics/metrics.yaml','a') as file:
        ruamel.yaml.dump_all(metric_list,file, Dumper=ruamel.yaml.RoundTripDumper,)
            


def write_semantic_models(model: SemanticManifestBuildResult): 
    """
    This function takes in a MetricFlow ModelBuildResult and 
    creates a yaml file for each data source in the ModelBuildResult.
    """
    if os.path.exists('data_source'):

        os.system('rm -rf data_source')
        os.mkdir('data_source')
    else:
        os.mkdir('data_source')
    
    if os.path.exists('semantic_models'):
        os.system('rm -rf semantic_models')
        os.mkdir('semantic_models')
    else:
        os.mkdir('semantic_models')

    if model.issues.errors:
         return print("\nPlease fix errors in semantic model and re run the converter")
    for data_source in model.semantic_manifest.semantic_models:
        with open(f'data_source/config_{data_source.name}.json', 'w') as file:
            file.write(data_source.json(exclude_defaults=True))
        with open(f'data_source/config_{data_source.name}.json', 'r') as file:
            configuration = json.load(file)
        with open(f'semantic_models/{data_source.name}.yaml', "w") as file:
            ruamel.yaml.dump(configuration,file, Dumper=ruamel.yaml.RoundTripDumper)
    return print("Success! Semantic Models and Metrics Created")

def delete_json_files(model_dir_path: str):
    json_configs = glob.glob(f'{model_dir_path}/*.json')
    for config in json_configs:
        os.remove(config)

