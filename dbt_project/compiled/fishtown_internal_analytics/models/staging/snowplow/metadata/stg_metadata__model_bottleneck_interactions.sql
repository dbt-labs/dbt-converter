

with 

unstruct_events as (

    select * from analytics_dev.dbt_jstein.current_snowplow_unstruct_event_splitter
    where 1=1
    
    

        and collector_tstamp >= dateadd(d, -3, current_date)

    
    
    

        and collector_tstamp >= (select max(_loaded_at) from analytics_dev.dbt_jstein.stg_metadata__model_bottleneck_interactions)

    


),

field_extraction as (

    select
        'snowpipe' as _source,
        event_id,
        database_source,

        unstruct_event:account_id::string as account_id,
        unstruct_event:environment_id::string as environment_id,
        unstruct_event:job_id::string as job_definition_id,
        unstruct_event:project_id::string as project_id,
        unstruct_event:run_id::string as run_id,
        unstruct_event:user_id::string as user_id,
        
        unstruct_event:interaction_type::string as interaction_type,
        
        derived_tstamp::timestamp_ntz as event_at,
        collector_tstamp::timestamp_ntz as _loaded_at
    
    from unstruct_events
    where event_name = 'metadata_model_bottleneck_viz_interaction'


),

final as (

    select
        _source,
        event_id,
        database_source,

        case
          when database_source = 'cloud'
                then account_id::varchar
          else md5(database_source || account_id)
      end as account_id,

      account_id as tenant_account_id,
        case
          when database_source = 'cloud'
                then environment_id::varchar
          else md5(database_source || environment_id)
      end as environment_id,

      environment_id as tenant_environment_id,
        case
          when database_source = 'cloud'
                then job_definition_id::varchar
          else md5(database_source || job_definition_id)
      end as job_definition_id,

      job_definition_id as tenant_job_definition_id,
        case
          when database_source = 'cloud'
                then project_id::varchar
          else md5(database_source || project_id)
      end as project_id,

      project_id as tenant_project_id,
        case
          when database_source = 'cloud'
                then run_id::varchar
          else md5(database_source || run_id)
      end as run_id,

      run_id as tenant_run_id,
        case
          when database_source = 'cloud'
                then user_id::varchar
          else md5(database_source || user_id)
      end as user_id,

      user_id as tenant_user_id,

        interaction_type,

        event_at,
        _loaded_at

    from field_extraction

)

select * from final