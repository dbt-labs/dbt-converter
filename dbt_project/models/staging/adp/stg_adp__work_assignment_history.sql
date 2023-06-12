with

source as (

    select * from {{ source('adp', 'work_assignment_history') }}
    where primary_indicator = true

),

-- Create logic to identify first occurrence of a job title changing
-- This is primarily used if Person A goes from Job Title A to Job Title B then back to Job Title A
lagged as (

    select

        *,

        lag(job_title) over(
            partition by worker_id
            order by assignment_status_effective_date asc
        ) as prior_job_title,
        case
            when job_title = null
                then 0
            when prior_job_title = job_title
                then 0
            else 1
        end as is_job_title_change

    from source

),

aggregated as (

    select
        
        *,

        sum(is_job_title_change) over(
            partition by worker_id
            order by assignment_status_effective_date asc
            rows between unbounded preceding and current row
        ) as cumulative_job_titles

    from lagged

),

-- Identify the first occurrence of each assignment
deduplicated_work_assignments as (

    select
        id as worker_assignment_id,
        worker_id,
        position_id,
        
        job as job_acronym,
        job_title,
        management_position_indicator as is_management_position,

        assignment_status_short_name as assignment_status,
        assignment_status_reason_short_name as assignment_status_reason,
        
        cumulative_job_titles,
        min(assignment_status_effective_date) as assignment_effective_at

    from aggregated
    {{ dbt_utils.group_by(n=9)}}

),

window_dates_for_timeseries as (

    select
        worker_assignment_id,
        worker_id,
        position_id,

        job_acronym,
        job_title,
        is_management_position,

        assignment_status,
        assignment_status_reason,

        min(assignment_effective_at) over (partition by worker_id) as first_assignment_started_at,
        max(assignment_effective_at) over (partition by worker_id) as current_assignment_started_at,
        lead(assignment_effective_at) over (partition by worker_id order by assignment_effective_at) as assignment_valid_to,
        assignment_effective_at as assignment_valid_from

    from deduplicated_work_assignments

),

final as (

    select
        worker_assignment_id,
        worker_id,
        position_id,

        job_acronym,
        job_title,
        is_management_position,

        assignment_status,
        assignment_status_reason,

        case
            when first_assignment_started_at = assignment_valid_from
                then true
            else false
        end as is_first_assignment,
        case
            when current_assignment_started_at = assignment_valid_from
                then true
            else false
        end as is_current_assignment,

        -- 'N' == not paid through ADP workforcenow
        case
            when right(position_id, 1) = 'N'
                then true
            else false
        end as is_worker_outside_of_usa,

        assignment_valid_from,
        coalesce(
            assignment_valid_to,
            '{{ var("future_proof_date") }}'
        ) as assignment_valid_to  -- Future proof'd date is most recent record

    from window_dates_for_timeseries

)

select * from final