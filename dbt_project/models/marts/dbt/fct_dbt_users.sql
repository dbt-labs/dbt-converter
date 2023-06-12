{{
    config(
        snowflake_warehouse = set_warehouse_config('large')
    )
}}

{% set window_clause %}
    partition by user_id
    order by started_at
    rows between unbounded preceding and unbounded following
{% endset %}

with invocations as (

  select * from {{ ref('fct_dbt_invocations') }}
  where is_completed_invocation

),

user_last_run as (

    select distinct
    
        user_id,
        user_name,

        last_value(user_type) over (
            {{ window_clause }}
        ) as user_type,

        last_value(internal) over (
            {{ window_clause }}
        ) as internal,

        min(started_at) over (partition by user_id) as first_run,
        max(started_at) over (partition by user_id) as last_run,
        count(*) over (partition by user_id) as num_invocations,

        last_value(city_id) over (
            {{ window_clause }}
        ) as city_id

    from invocations

)

select * from user_last_run
