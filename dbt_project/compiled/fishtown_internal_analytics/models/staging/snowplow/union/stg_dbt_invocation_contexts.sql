

with fishtown as (

    select * from analytics_dev.dbt_jstein.current_snowplow_invocation
    
    where _loaded_at > (select max(_loaded_at) from analytics_dev.dbt_jstein.stg_dbt_invocation_contexts)
    

),

fivetran as (

    select * from analytics_dev.dbt_jstein.historical_snowplow_invocation
    
    where _loaded_at > (select max(_loaded_at) from analytics_dev.dbt_jstein.stg_dbt_invocation_contexts)
    

),

unioned as (

    select * from fishtown
    union all
    select * from fivetran

)

select * from unioned