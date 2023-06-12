{# this is overriding the default macro to support our specialized incremental runs #}

{# this first macro is just a mirror of the default should_full_refresh logic
which can be found in the dbt-snowflake adaptor repo #}
{% macro is_full_refresh_flagged() %}

  {% set raw_config_full_refresh = config.get('full_refresh') %}
  {% if raw_config_full_refresh is none %}
    {% set raw_config_full_refresh = flags.FULL_REFRESH %}
  {% endif %}

  {% do return(raw_config_full_refresh) %}

{% endmacro %}

{# this second macro is just a retrieving the override flag which
we treat as a separate macro here so we can use it in other logical
steps with better clarity #}
{% macro is_cold_storage_flagged() %}

  {% set is_cold_storage_disabled = var('disable_cold_storage') %}
  
  {% if is_cold_storage_disabled %}
    {% set config_model_cold_storage_flag = FALSE %}
  {% else %}
    {% set config_model_cold_storage_flag = config.get('cold_storage') %}
  {% endif %}

  {% do return(config_model_cold_storage_flag) %}

{% endmacro %}

{# this third macro takes the place of the original should_full_refresh()
which ultimately does one thing, control whether the table is dropped or
incrementally added to. This new iterration lets us have fine tune over that
but allows us to leverage current mechanisms for incremental models so we
need not re-build the entire materialization #}
{% macro should_full_refresh() %}

  {% if is_cold_storage_flagged() %}
    {% set config_full_refresh = FALSE %}
  {% else %}
    {% set config_full_refresh = is_full_refresh_flagged() %}
  {% endif %}

  {% do return(config_full_refresh) %}

{% endmacro %}
