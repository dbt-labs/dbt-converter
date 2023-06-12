{% macro enhanced_incremental_filters(ref_timestamp, this_timestamp, day_overwrite=false) %}

    {% if target.name in ['dev', 'default'] %}
        and {{ ref_timestamp }} >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)
    {% endif %}
    
    {# separating this logic to allow both incremental and limited data in dev runs for testing#}
    {% if is_incremental() and not is_full_refresh_flagged() %}
        {% if day_overwrite %}
            and {{ ref_timestamp }} > (select dateadd(day, -1, max({{ this_timestamp }})) from {{ this }})
        {% else %}
            and {{ ref_timestamp }} >= (select max({{ this_timestamp }}) from {{ this }})
        {% endif %}
    {% endif %}

    {# this section controls cutoff date logic -- test this logic when going from view to incremental for the first time #}
    {% if is_full_refresh_flagged() and is_cold_storage_flagged() %}
        {% if config.get('cold_storage_date_type') == 'date' %}
            and {{ ref_timestamp }} >= '{{ config.get("cold_storage_date") }}'
        {% elif config.get('cold_storage_date_type') == 'relative' %}
            and {{ ref_timestamp }} >= dateadd({{ config.get('cold_storage_period') }}, -{{ config.get('cold_storage_value') }}, current_date())
        {% endif %}
        
    {% endif %}


{% endmacro %}