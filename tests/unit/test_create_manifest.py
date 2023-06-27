from metricflow_parsing.dbt_dir_to_model import parse_dbt_project_to_model

def test_generate_manifest():
    manifest = parse_dbt_project_to_model('converter/tests/test_dbt_project')
    assert manifest is not None

    