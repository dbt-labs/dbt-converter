{{ config(materialized='incremental', unique_key='event_id') }}

with

marketing_branches as (

select * from {{ ref('current_snowplow_context_splitter') }}
where context_type = 'marketing_branch_name'

{% if target.name in ['dev', 'default'] %}

    and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

{% endif %}

{% if is_incremental() %}

    and _loaded_at >= (select max(_loaded_at) from {{ this }})

{% endif %}
    
),

parsed as (

select
    *,
    lower(context:experimentName::string) as experiment_name,
    lower(context:branchName::string) as branch_name

from marketing_branches

)

select * from parsed