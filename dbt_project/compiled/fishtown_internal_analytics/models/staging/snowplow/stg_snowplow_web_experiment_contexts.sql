

with

marketing_branches as (

select * from analytics_dev.dbt_jstein.current_snowplow_context_splitter
where context_type = 'marketing_branch_name'



    and collector_tstamp >= dateadd(d, -3, current_date)





    and collector_tstamp >= (select max(collector_tstamp) from analytics_dev.dbt_jstein.stg_snowplow_web_experiment_contexts)


    
),

parsed as (

select
    *,
    lower(context:experimentName::string) as experiment_name,
    lower(context:branchName::string) as branch_name

from marketing_branches

)

select * from parsed