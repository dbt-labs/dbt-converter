

with fishtown as (

    select * from analytics_dev.dbt_jstein.current_snowplow_run_model
    
    where _loaded_at > (select max(_loaded_at) from analytics_dev.dbt_jstein.stg_dbt_run_model_contexts)
    

),

fivetran as (

    select
        *,
        null::string as language

    from analytics_dev.dbt_jstein.historical_snowplow_run_model
    
    where _loaded_at > (select max(_loaded_at) from analytics_dev.dbt_jstein.stg_dbt_run_model_contexts)
    

),

unioned as (

    select * from fishtown
    union all
    select * from fivetran

)

select * from unioned