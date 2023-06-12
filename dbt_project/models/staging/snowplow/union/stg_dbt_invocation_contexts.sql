
{{config(materialized='incremental', unique_key='event_id')}}

with fishtown as (

    select * from {{ ref('current_snowplow_invocation') }}
    {% if is_incremental() %}
    where _loaded_at > (select max(_loaded_at) from {{ this }})
    {% endif %}

),

fivetran as (

    select * from {{ ref('historical_snowplow_invocation') }}
    {% if is_incremental() %}
    where _loaded_at > (select max(_loaded_at) from {{ this }})
    {% endif %}

),

unioned as (

    select * from fishtown
    union all
    select * from fivetran

)

select * from unioned
