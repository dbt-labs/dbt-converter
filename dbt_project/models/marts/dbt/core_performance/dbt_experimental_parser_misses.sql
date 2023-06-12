/*
    For each experimenntal parser miss, try to find a dbt Cloud scheduled run
    whose artifacts can help us find the cause of the miss. First try joining
    on the specific invocation_id; if that doesn't work, try finding the last
    scheduler run for that project_id.
*/

with misses as (

    select * from {{ ref('dbt_experimental_parser_samples') }}
    where parser_status_summary = 'mismatch'

),

scheduler_invocations as (

    select * from {{ ref('fct_dbt_invocations') }}
    where product = 'scheduler'

),

specific_invocations as (

    select
    
        scheduler_invocations.invocation_id,
        scheduler_invocations.run_id
    
    from scheduler_invocations

),

last_scheduler_runs as (

    select
    
        scheduler_invocations.project_id,
        scheduler_invocations.run_id
    
    from scheduler_invocations
    qualify row_number() over (partition by project_id order by started_at desc) = 1

),

joined as (

    select

        misses.*,
        coalesce(specific_invocations.run_id, last_scheduler_runs.run_id) as run_id

    from misses
    -- prefer specific invocation if available
    left join specific_invocations
      on misses.invocation_id = specific_invocations.invocation_id
    -- otherwise use the last scheduled run for this project
    left join last_scheduler_runs
      on misses.project_id = last_scheduler_runs.project_id
      and specific_invocations.invocation_id is null

)

select * from joined
