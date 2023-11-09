import glob
import json

import yaml
from dbt_semantic_interfaces.parsing.dir_to_model import SemanticManifestBuildResult
import ruamel.yaml
import os

OUTPUT_DIR = "dbt_semantic_layer"


def manifest_to_project(model: SemanticManifestBuildResult):
    write_semantic_models(model)
    write_metrics(model)

    delete_json_files(OUTPUT_DIR)
    delete_json_files("data_source")
    configs = MetricFlowConfig(
        os.path.join(os.getcwd(), "semantic_models"),
        os.path.join(os.getcwd(), OUTPUT_DIR),
    )
    to_yaml_multi_file(config=configs)


def write_semantic_models(model: SemanticManifestBuildResult):
    """
    This function takes in a MetricFlow ModelBuildResult and
    creates a yaml file for each data source in the ModelBuildResult.
    """
    if os.path.exists("data_source"):
        os.system("rm -rf data_source")
    os.mkdir("data_source")

    if os.path.exists("semantic_models"):
        os.system("rm -rf semantic_models")
    os.mkdir("semantic_models")

    if model.issues.errors:
        return print("\nPlease fix errors in semantic model and re run the converter")
    for data_source in model.semantic_manifest.semantic_models:
        with open(f"data_source/config_{data_source.name}.json", "w") as file:
            file.write(data_source.json(exclude_defaults=True))
        with open(f"data_source/config_{data_source.name}.json", "r") as file:
            configuration = json.load(file)
        with open(f"semantic_models/{data_source.name}.yaml", "w") as file:
            ruamel.yaml.dump(configuration, file, Dumper=ruamel.yaml.RoundTripDumper)


def write_metrics(model: SemanticManifestBuildResult):
    if os.path.exists(OUTPUT_DIR):
        os.system(f"rm -rf {OUTPUT_DIR}")
    os.mkdir(OUTPUT_DIR)

    # Intialize a new list of metrics
    metric_list = []
    # dump json to yaml for each metric in the model
    for metric in model.semantic_manifest.metrics:
        with open(f"metrics/{metric.name}.json", "w+") as f:
            f.write(
                metric.json(exclude_defaults=True)
            )  # It would probably be cleaner not to write these files, but i can't figure out how to get the encoding to work :^)
    for filename in glob.glob(
        f"{OUTPUT_DIR}/*.json"
    ):  # iterate over each file name that matches this pattern
        with open(filename, "r") as f:
            metric_list.append(json.load(f))

    with open(f"{OUTPUT_DIR}/metrics.yaml", "a") as file:
        ruamel.yaml.dump_all(
            metric_list,
            file,
            Dumper=ruamel.yaml.RoundTripDumper,
        )


def delete_json_files(model_dir_path: str):
    json_configs = glob.glob(f"{model_dir_path}/*.json")
    for config in json_configs:
        os.remove(config)


class MetricFlowConfig:
    models = []
    metrics = []

    def __init__(self, model_dir_path: str, metric_dir_path: str) -> None:
        """
        initalize MetricFlowConfigs from a directory of semantic models and metrics.
        """
        model_configs = glob.glob(f"{model_dir_path}/*.yaml") + glob.glob(
            f"{model_dir_path}/*.yml"
        )
        metric_configs = glob.glob(f"{metric_dir_path}/*.yaml") + glob.glob(
            f"{metric_dir_path}/*.yml"
        )
        for model in model_configs:
            with open(model) as stream:
                self.models.append(yaml.safe_load(stream))
        for metric in metric_configs:
            with open(metric) as stream:
                for metric in yaml.safe_load_all(stream):
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
                    metric["type_params"]["measure"] = metric["type_params"]["measure"][
                        "name"
                    ]


def to_yaml_multi_file(config: MetricFlowConfig):
    config.update_sql_table()
    config.filter_format()
    config.nest_measures()
    config.add_label()

    yaml = ruamel.yaml.YAML()
    yaml.indent(mapping=2, sequence=4, offset=2)

    for model in config.models:
        model_list = []
        model_list.append(model)
        semantic_models = {}
        semantic_models[
            "semantic_models"
        ] = model_list  # nest all models under the semantic models key
        with open(f'semantic_models/{model["name"]}.yaml', "w") as stream:
            yaml.dump(semantic_models, stream)
    for metric in config.metrics:
        metric_list = []
        metric_list.append(metric)  # need to nest metric under a metrics key
        metrics = {}
        metrics[
            "metrics"
        ] = metric_list  # nest all models under the semantic models key
        with open(f'{OUTPUT_DIR}/{metric["name"]}.yaml', "w") as stream:
            yaml.dump(
                metrics,
                stream,
            )
    os.remove(
        f"{OUTPUT_DIR}/metrics.yaml"
    )  # Remove metrics.yaml file after spec upgrade
