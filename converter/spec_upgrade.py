import yaml
import glob
from typing import Sequence

class MetricFLowConfig:
    models = Sequence
    metrics = Sequence

    def __init__(self, model_dir_path: str, metric_dir_path) -> None:
        model_configs = glob.glob(f'{model_dir_path}/*.yaml')
        metric_configs = glob.glob() 
        for model in model_configs:
            with open(model) as stream:
                self.models.append(yaml.safe_load(stream))
        pass