{{
    config(
        materialized='incremental',
        unique_key='event_id'
) }}

with run_model_events as (

    select * from {{ ref('stg_dbt_run_model_events') }}

    {% if is_incremental() %}
        where _loaded_at > (select max(_loaded_at) from {{ this }})
    {% endif %}

)

select * from run_model_events