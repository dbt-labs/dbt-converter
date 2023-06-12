
  
    

        create or replace transient table analytics_dev.dbt_jstein.ip_lookup  as
        (

-- this is useful for categorizing events which occurred
-- before adoption of the invocation_env context

with events as (

    select * from analytics_dev.dbt_jstein.stg_dbt_events

),

environments as (

    select * from analytics_dev.dbt_jstein.stg_dbt_invocation_env_contexts

),

joined as (

    --circle runs from a bunch of IPs. get all current IPs we have a circle 
    --context for so that we can later use them in the mapping table.
    select distinct
        user_ipaddress as ip_address
    from events
    join environments using (event_id)
    where environments.environment = 'ci-circle'

),

unioned as (

    select '52.205.23.110' as ip, 'bastion' as source union all
    select '52.45.144.63', 'cloud' union all
    select '74.205.54.20', 'ci-appveyor' union all
    select ip_address, 'ci-circle' from joined

)

select * from unioned
        );
      
  