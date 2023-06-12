
{{
    config(
        materialized='incremental',
        unique_key='id'
    )
}}

with

metadata_api_requests as (

    select * from {{ ref('stg_metadata_api__requests') }}
    where 1=1

    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)
    
    {% endif %}
    
    {% if is_incremental() %}

        and _loaded_at >= (select max(event_date) from {{ this }})

    {% endif %}

),

model_bottleneck as (

    select * from {{ ref('stg_metadata__model_bottleneck_interactions') }}
    where 1=1

    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)
    
    {% endif %}

    {% if is_incremental() %}

        and _loaded_at >= (select max(event_date) from {{ this }})

    {% endif %}

),

api_requests_summarized as (

    select
        account_id,
        user_id,
        created_at::date as event_date,

        {{ dbt_utils.generate_surrogate_key([
            'user_id',
            'account_id',
            'event_date'])
        }} as id,
        count(distinct event_id) as total_metadata_api_requests,
        count(case when source_buckets != 'cloud-app' then event_id end) as total_external_metadata_api_requests,
        count(case when source_buckets = 'cloud-app' then event_id end) as total_internal_metadata_api_requests,
        count(distinct source) as source_count,
        listagg(distinct source, ', ') as source_list,
        min(event_date) as first_metadata_api_requests_at,
        max(event_date) as last_metadata_api_requests_at
    
    from metadata_api_requests
    group by 1,2,3,4

),

model_bottleneck_summarized as (

    select
        account_id,
        user_id,
        event_at::date as event_date,

        {{ dbt_utils.generate_surrogate_key([
            'user_id',
            'account_id',
            'event_date'])
        }} as id,

        count(distinct event_id) as total_model_bottleneck_viz_events,
        min(event_date) as first_model_bottleneck_viz_at,
        max(event_date) as last_model_bottleneck_viz_at
    
    from model_bottleneck
    -- exclude failed renders or interactions to get the right count
    where interaction_type not ilike '%unavailable%'
    group by 1,2,3,4

),

final as (

    select *
    from api_requests_summarized
    full outer join model_bottleneck_summarized
        using (account_id, user_id, event_date, id)

)

select * from final