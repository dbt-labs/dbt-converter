

with model_execution as (

    select * 
    from analytics_dev.dbt_jstein.stg_dbt_run_model_events
    where
        1=1
    

        and collector_tstamp >= dateadd(d, -3, current_date)
    
    
    
    

),

diffed as (

    select model_execution.*,

        

            row_number() over (
                partition by project_id, model_id
                order by dvce_created_tstamp
            ) = 1 as is_new,

        

        /*
            The `mode` window function returns the most common content hash for a
            given model on a given day. We use this a proxy for the 'production'
            version of the model, running in deployment. When a different hash 
            is run, it likely reflects that the model is undergoing development.
        */
        
        model_execution.contents != mode(model_execution.contents) over (
            partition by model_execution.project_id, model_execution.model_id, model_execution.dvce_created_tstamp::date
        ) as is_changed
        
    from model_execution
        
    
),

final as (

    select
        invocation_id,
        max(collector_tstamp) as max_collector_tstamp,
        max(model_complexity) as model_complexity,
        count(distinct language) as languages_used,

        --overall model count and model build status
        max(model_total) as count_models,
        sum(case when is_new or is_changed then 1 else 0 end) as count_changed,
        sum(case when skipped = true then 1 else 0 end) as count_skip,
        sum(case when error is null or error = 'false' then 0 else 1 end) as count_error,
        sum(case when (error is null or error = 'false') and skipped = false then 1 else 0 end) as count_succeed,

        --overall counts by materialization for each invocation
        count(case when materialization = 'view' then model_id end) as count_view_models,
        count(case when materialization = 'table' then model_id end) as count_table_models,
        count(case when materialization = 'incremental' then model_id end) as count_incremental_models,
        count(case when materialization not in ('view','table','incremental','seed','snapshot','archive') then model_id end) as count_custom_materialization_models,

        --overall counts by dbt command
        count(case when materialization = 'seed' then model_id end) as count_seeds,
        count(case when materialization in ('snapshot', 'archive') then model_id end) as count_snapshots,
        
        --by language (either 'sql' or 'python')
        count(case when language = 'python' then model_id end) as count_python

    from diffed
    group by 1

)

select * from final