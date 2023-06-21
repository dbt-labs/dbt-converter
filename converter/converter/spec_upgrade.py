import yaml
import ruamel.yaml
import glob
from typing import List, Dict
import textwrap


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
            if "node_relation" in model.keys():
                model["model"] = f'ref(\'{model["node_relation"]["alias"]}\')'
                del model["node_relation"]
    def add_label(self):
        for metric in self.metrics:
            metric["label"] = " "


    def filter_format(self):
        for metric in self.metrics:
            if "filter" in metric.keys():
                metric["filter"] = f'{metric["filter"]["where_sql_template"]}'
    def nest_measures(self):
        for metric in self.metrics:
            if "type" in metric.keys():
                if metric["type"] == "simple":
                    measures = []
                    for measure in metric["type_params"]["measure"]:
                        measures.append(metric["type_params"]["measure"]["name"])
                    # print(measures)
                    metric["type_params"]["measures"] = measures
                    # print(metric)
                    del metric["type_params"]["measure"]
    

def to_yaml_monofile(config: MetricFLowConfig):
    config.update_sql_table()
    config.filter_format()
    config.nest_measures()
    config.add_label()
    
    yaml = ruamel.yaml.YAML()
    yaml.indent(mapping=2, sequence=4, offset=2)
    semantic_models = {}
    mertics = {}
    semantic_models["semantic_models"] = configs.models #nest all models under the semantic models key
    mertics["metrics"] = config.metrics
    with open('semantic_models/semantic_models.yaml', 'w') as stream:
         yaml.dump(semantic_models,stream)
    with open('metrics/metrics.yaml', 'w') as stream:
       yaml.dump(mertics,stream)

def to_yaml_mutli_file(config: MetricFLowConfig):
    config.update_sql_table()
    config.filter_format()
    config.nest_measures()
    config.add_label()
    
    yaml = ruamel.yaml.YAML()
    yaml.indent(mapping=2, sequence=4, offset=2)

    for model in config.models:
        model_list=[]
        model_list.append(model)
        semantic_models = {}
        semantic_models["semantic_models"] =  model_list #nest all models under the semantic models key
        with open(f'semantic_models/{model["name"]}.yaml', 'w') as stream:
            yaml.dump(semantic_models,stream)
    for metric in config.metrics:
        metric_list=[]
        metric_list.append(metric) #need to nest metric under a metrics key
        metrics = {}
        metrics["metrics"] =  metric_list #next all models under the semantic models key
        with open(f'metrics/{metric["name"]}.yaml', 'w') as stream:
          yaml.dump(metrics,stream, )

#{'name': 'semantic_layer_enabled_accounts', 'description': 'The sum of all active dbt Cloud accounts with the Semantic Layer enabled in their environment.', 'type': 'measure_proxy', 'type_params': {'measure': {'name': 'semantic_layer_enabled_accounts'}},
#  'constraint': {'where': 'has_successful_semantic_layer_run = 1 AND is_primary_cloud_account = true AND is_partner_training_acct = false', 'linkable_names': ['has_successful_semantic_layer_run', 'is_primary_cloud_account', 'is_partner_training_acct'], 'sql_params': {'param_items': []}}}