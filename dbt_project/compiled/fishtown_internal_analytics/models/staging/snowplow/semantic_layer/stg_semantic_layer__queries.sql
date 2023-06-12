

with 

unstruct_events as (
    select * from analytics_dev.dbt_jstein.current_snowplow_unstruct_event_splitter
    
    -- When this feature was released
    where collector_tstamp >= '2022-10-18'
        and event_name = 'semantic_layer_compile_request_metric'

    
        
        and collector_tstamp >= dateadd(d, -3, current_date)
    
    
    
    
    
        and collector_tstamp >= (select max(collector_tstamp) from analytics_dev.dbt_jstein.stg_semantic_layer__queries)
    
    
),

field_extraction as (
    
    select
        'snowpipe' as _source,
        event_id,
        database_source,

        nullif(unstruct_event:account_id::varchar, '') as account_id,

        unstruct_event:compile_start::integer as compile_start_unix,
        unstruct_event:compile_end::integer as compile_end_unix,
        
        nullif(unstruct_event:compile_request_id::varchar, '') as compile_request_id,
        nullif(unstruct_event:custom_subdomain::varchar, '') as custom_subdomain,
        nullif(unstruct_event:environment_id::varchar, '') as environment_id,
        nullif(unstruct_event:hostname::varchar, '') as hostname,
        unstruct_event:is_compilation_successful::boolean as is_compilation_successful,
        nullif(unstruct_event:query_type::varchar, '') as query_type,
        nullif(unstruct_event:warehouse_account_id::varchar, '') as warehouse_account_id,

        collector_tstamp
    
    from unstruct_events

),

id_hashing as (

    select
        _source,
        event_id,
        database_source,

        case
          when database_source = 'cloud'
                then account_id::varchar
          else md5(database_source || account_id)
      end as account_id_hashed,

      account_id as tenant_account_id_hashed,

        --if this isn't an actual cloud account_id,
        --then keep it null. otherwise, hash it
        case
            when account_id is null
                then account_id
            else account_id_hashed
        end as account_id,

        case
          when database_source = 'cloud'
                then environment_id::varchar
          else md5(database_source || environment_id)
      end as environment_id_hashed,

      environment_id as tenant_environment_id_hashed,

        --if this isn't an actual cloud environment_id,
        --then keep it null. otherwise, hash it
        case
            when environment_id is null
                then environment_id
            else environment_id_hashed
        end as environment_id,

        compile_start_unix,
        compile_end_unix,
        compile_request_id,
        custom_subdomain,
        hostname,
        is_compilation_successful,
        query_type,
        warehouse_account_id,

        collector_tstamp

    from field_extraction

),

final as (

    select
        _source,
        event_id,
        database_source,

        account_id,
        tenant_account_id_hashed as tenant_account_id,
        environment_id,
        tenant_environment_id_hashed as tenant_environment_id,     

        -- couldn't get from_unixtimestamp to work. Will circle back
        -- removed curly braces to stop it from looking for the macro
        --  from_unixtimestamp(compile_start_unix,format='seconds')  as compile_start,
        --  from_unixtimestamp(compile_end_unix,format='seconds')  as compile_end,
        to_timestamp_ntz(compile_start_unix,3) as compile_start,
        to_timestamp_ntz(compile_end_unix,3) as compile_end,

        compile_request_id,
        custom_subdomain,

        hostname,
        is_compilation_successful,
        case
            when query_type = 0
                then 'dbt_sql'
            when query_type = 1
                then 'standard_sql'
            when query_type = 2
                then 'unknown'
        end as query_type,
        warehouse_account_id,

        collector_tstamp

    from id_hashing

)

select * from final