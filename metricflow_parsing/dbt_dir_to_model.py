from dataclasses import dataclass
from dbt import tracking
from dbt.parser.manifest import ManifestLoader as DbtManifestLoader, Manifest as DbtManifest
from dbt_semantic_interfaces.transformations.semantic_manifest_transformer import PydanticSemanticManifestTransformer
from dbt_semantic_interfaces.parsing.dir_to_model  import SemanticManifestBuildResult #modelbuildreulst --> semanticmanifest build result
from .dbt_to_metricflow import DbtManifestTransformer
from typing import Optional
from dbt.cli.main import dbtRunner


@dataclass
class DbtProfileArgs:
    """Class to represent dbt profile arguments

    dbt's get_dbt_config uses `getattr` to get values out of the passed in args.
    We cannot pass a simple dict, because `getattr` doesn't work for keys of a
    dictionary. Thus we create a simple object that `getattr` will work on.
    """

    profile: Optional[str] = None
    target: Optional[str] = None


def get_dbt_project_manifest(project_dir: str) -> DbtManifest:
    """Builds the dbt Manifest object from the dbt project"""
    dbt = dbtRunner()
    test = dbt.invoke(['parse', '--project-dir', project_dir])
    # If we don't disable tracking, we have to setup a full
    # dbt User object to build the manifest
    tracking.disable_tracking()
    return test.result


def parse_dbt_project_to_model(project_dir: str) -> SemanticManifestBuildResult:
    """Parse dbt model files in the given directory to a UserConfiguredModel."""
    manifest = get_dbt_project_manifest(project_dir)
    build_result = DbtManifestTransformer(manifest=manifest).build_user_configured_model()
    transformed_model = PydanticSemanticManifestTransformer.transform(build_result.semantic_manifest)
    return SemanticManifestBuildResult(semantic_manifest=transformed_model, issues=build_result.issues)

