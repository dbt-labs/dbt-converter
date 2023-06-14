import yaml
import ruamel.yaml
import glob
from typing import List, Dict

class MetricFLowConfig:
    models = []
    metrics = []

    def __init__(self, model_dir_path: str, metric_dir_path: str) -> None:
        """
        initalize MetricFlowConfigs from a directory of semantic models and metrics.
        """
        model_configs = glob.glob(f'{model_dir_path}/*.yaml')
        metric_configs = glob.glob(f'{metric_dir_path}/*.yaml')
        for model in model_configs:
            with open(model) as stream:
                self.models.append(yaml.safe_load(stream))
        for metric in metric_configs:
            with open(metric) as stream:
                for metric in (yaml.safe_load_all(stream)):
                    self.metrics.append(metric)

    def update_sql_table(self):
        for model in self.models:
            del model["sql_table"]
            dbt_model_list = str.split(model["dbt_model"],".")
            model["model"] = f'ref(\'{dbt_model_list[2]}\')'
            del model["dbt_model"]
    
    def update_agg_time_dimension(self):
        for model in configs.models:
            for dimension in model["dimensions"]:
                if dimension["type"] == 'time' and dimension["type_params"][list(dimension["type_params"].keys())[0]] == True : # the time dimension is the primary time dimension
                    model["defaults"] = {"agg_time_dimension": dimension["name"]}
                    dimension["type_params"] = {'time_granularity': dimension["type_params"]["time_granularity"] }

    def measure_proxy_to_simple(self):
        for metric in self.metrics:
            if metric["type"] == 'measure_proxy':
                metric["type"] = 'simple'
    def constraint_to_filter(self):
        for metric in self.metrics:
            if 'constraint' in list(metric.keys()):
                metric["filter"] = metric['constraint']["where"]
                # print(metric)
        for metric in self.metrics:
            if 'filter' in list(metric.keys()):
                for dimension in metric['constraint']["linkable_names"]:
                    metric['filter']= metric['filter'].replace(dimension, f'{{{{dimension(\'{dimension}\')}}}}') 
    def delete_constraint(self):
        for metric in self.metrics:
            if 'constraint' in list(metric.keys()):
                del metric['constraint']
        
    
def to_yaml_monofile(config: MetricFLowConfig):
    config.update_sql_table()
    config.update_agg_time_dimension()
    config.measure_proxy_to_simple()
    config.constraint_to_filter()
    config.delete_constraint()

    semantic_models = {}
    mertics = {}
    semantic_models["semantic_models"] = configs.models #next all models under the semantic models key
    mertics["metrics"] = config.metrics
    with open('semantic_models.yaml', 'w') as stream:
         ruamel.yaml.dump(semantic_models,stream, Dumper=ruamel.yaml.RoundTripDumper)
    with open('metrics.yaml', 'w') as stream:
        ruamel.yaml.dump(mertics,stream, Dumper=ruamel.yaml.RoundTripDumper)

def to_yaml_mutli_file(config: MetricFLowConfig):
    config.update_sql_table()
    config.update_agg_time_dimension()
    for model in config.models:
        semantic_models = {}
        semantic_models["semantic_models"] =  model #next all models under the semantic models key
        with open(f'{model["name"]}.yaml', 'w') as stream:
            ruamel.yaml.dump(semantic_models,stream, Dumper=ruamel.yaml.RoundTripDumper)



configs = MetricFLowConfig('/Users/jordanstein/Dev/dbt-converter/semantic_models','/Users/jordanstein/Dev/dbt-converter/metrics')
to_yaml_monofile(configs)

#{'name': 'semantic_layer_enabled_accounts', 'description': 'The sum of all active dbt Cloud accounts with the Semantic Layer enabled in their environment.', 'type': 'measure_proxy', 'type_params': {'measure': {'name': 'semantic_layer_enabled_accounts'}},
#  'constraint': {'where': 'has_successful_semantic_layer_run = 1 AND is_primary_cloud_account = true AND is_partner_training_acct = false', 'linkable_names': ['has_successful_semantic_layer_run', 'is_primary_cloud_account', 'is_partner_training_acct'], 'sql_params': {'param_items': []}}}