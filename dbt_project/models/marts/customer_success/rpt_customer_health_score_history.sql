{{
  config(
    materialized = 'incremental',
    full_refresh = False,
    on_schema_change = 'append_new_columns'
    )
}}

{# Define the frequency the table should be snapshot in days #}
{% set snapshot_frequency = 7 %}

select *
from {{ ref('rpt_customer_health_score') }}

{% if is_incremental() %}
where
    scored_at > ( select 
                        dateadd(
                            'day', 
                            {{ snapshot_frequency}} ,
                             max(scored_at)
                        )
                    from {{ this }} 
                )
{% endif %}