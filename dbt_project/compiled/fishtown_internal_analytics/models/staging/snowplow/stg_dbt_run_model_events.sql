

with run_model_events as (

    select
        event_id,
        se_label as invocation_id,
        collector_tstamp,
        dvce_created_tstamp,
        dvce_sent_tstamp

    from analytics_dev.dbt_jstein.stg_dbt_events
    where se_category = 'dbt' and se_action = 'run_model'

    

    
        and collector_tstamp >= dateadd(d, -3, current_date)
    
    
    
    

    
    




),

model_executions as (

    select
        event_id,
        model_id,
        run_status,
        execution_time,
        hashed_contents as contents,
        index as model_index,
        total as model_total,
        model_materialization as materialization,
        language,
        case
            when model_materialization not in ('view', 'table', 'seed', 'incremental', 'snapshot', 'archive') then 3
            when model_materialization in ('incremental', 'snapshot', 'archive') then 2
            else 1
            end as model_complexity,
        case when run_skipped = 'true' then true else false end as skipped,
        run_error as error

    from analytics_dev.dbt_jstein.stg_dbt_run_model_contexts

),

invocations as (

    select distinct invocation_id, project_id from analytics_dev.dbt_jstein.stg_dbt_invocation_events

),

joined as (

    select
        ev.event_id,
        ev.invocation_id,
        ev.collector_tstamp,
        ev.dvce_created_tstamp,
        ev.dvce_sent_tstamp,

        ex.model_id,
        ex.run_status,
        ex.execution_time,
        ex.contents,
        ex.model_index,
        ex.model_total,
        ex.materialization,
        ex.language,
        ex.model_complexity,
        ex.skipped,
        ex.error,

        inv.project_id

    from run_model_events ev
    join model_executions ex using (event_id)
    join invocations inv using (invocation_id)

)

select * from joined