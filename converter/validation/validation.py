from dbt_semantic_interfaces.parsing.dir_to_model import parse_directory_of_yaml_files_to_semantic_manifest


semantic_manifest = parse_directory_of_yaml_files_to_semantic_manifest(directory="results/semantic_models")