from metricflow_parsing.dbt_dir_to_model import parse_dbt_project_to_model
def test_generate_semantic_manifest():
    semantic_manifest = parse_dbt_project_to_model('converter/tests/test_dbt_project')
    assert semantic_manifest is not None