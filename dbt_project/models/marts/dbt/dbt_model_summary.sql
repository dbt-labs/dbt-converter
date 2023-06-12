
{{ 
    config(
        materialized = 'incremental',
        unique_key = 'invocation_id',
        snowflake_warehouse = set_warehouse_config('large', 'large')
    )
}}

with model_execution as (

    select * 
    from {{ ref('stg_dbt_run_model_events') }}
    where
        1=1
    {% if target.name in ['dev', 'default'] %}

        and collector_tstamp >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)
    
    {% endif %}
    
    {% if is_incremental() %}

        --incremental runs re-process a full day everytime to get an accurate mode below
        and collector_tstamp > (select max(max_collector_tstamp)::date from {{ this }})

    {% endif %}

),

{#-- When running rull refresh we have access to all records, so this logis isn't needed --#}
{% if is_incremental() %}
new_models as (

    select
        project_id,
        model_id,
        invocation_id,
        dvce_created_tstamp,
        true as is_new
    from {{ ref('stg_dbt_run_model_events') }} as base_table
    where
        exists (
                select 1 
                from model_execution 
                where 
                    base_table.project_id = model_execution.project_id
                    and base_table.model_id = model_execution.model_id
            )
    qualify
        row_number() over(partition by project_id, model_id order by dvce_created_tstamp) = 1
    

),
{% endif %}

diffed as (

    select model_execution.*,

        {% if is_incremental() %}
    
            new_models.is_new,

        {% else %}

            row_number() over (
                partition by project_id, model_id
                order by dvce_created_tstamp
            ) = 1 as is_new,

        {% endif %}

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
        {% if is_incremental() %}
            left join new_models on 
                model_execution.project_id = new_models.project_id 
                and model_execution.model_id = new_models.model_id
                and model_execution.invocation_id = new_models.invocation_id
                and model_execution.dvce_created_tstamp = new_models.dvce_created_tstamp
        {% endif %}
    
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
