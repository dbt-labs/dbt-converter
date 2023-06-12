
  
    

        create or replace transient table analytics_dev.dbt_jstein.stg_snowplow_web_page_contexts  as
        (

with fishtown as (

    select * from analytics_dev.dbt_jstein.current_snowplow_web_page

),

fivetran as (

    select * from analytics_dev.dbt_jstein.historical_snowplow_web_page_context

),

unioned as (

    select * from fishtown
    union all
    select * from fivetran

),

renamed as (

    select
        event_id as root_id,
        id,
        max(_loaded_at) as _loaded_at

    from unioned
    group by 1, 2

)

select * from renamed
        );
      
  