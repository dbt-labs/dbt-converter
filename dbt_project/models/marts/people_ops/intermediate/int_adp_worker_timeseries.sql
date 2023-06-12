with

work_assignment_history as (

    select * from {{ ref('stg_adp__work_assignment_history') }}

),

worker_reports_to as (

    select * from {{ ref('stg_adp__worker_reports_to') }}

),

-- For snapshots that are missing history, the historical timeframes need to be
-- backdated to hire date for the modeling approach to produce proper results.
null_worker_reports_to as (

    select
        work_assignment_history.worker_assignment_id,
        work_assignment_history.worker_id,
        work_assignment_history.assignment_valid_from as reports_to_valid_from,
        worker_reports_to.reports_to_valid_from as reports_to_valid_to,

        -- If first assignment start date is earlier than first reports to record
        case
            when work_assignment_history.assignment_valid_from < worker_reports_to.reports_to_valid_from
                then null
            else worker_reports_to.reports_to_worker_id
        end as reports_to_worker_id_nullified

    from work_assignment_history
    left join worker_reports_to
        on work_assignment_history.worker_assignment_id = worker_reports_to.worker_assignment_id
    where work_assignment_history.is_first_assignment = true
    and worker_reports_to.is_first_reports_to = true
    and reports_to_worker_id_nullified is null

),

unioned_worker_reports_to as (

    select
        worker_assignment_id,
        worker_id,
        reports_to_worker_id_nullified as reports_to_worker_id,
        reports_to_valid_from,
        reports_to_valid_to

    from null_worker_reports_to

    union

    select
        worker_assignment_id,
        worker_id,
        reports_to_worker_id,
        reports_to_valid_from,
        reports_to_valid_to

    from worker_reports_to

),

-- Join to spine [Step 5]
join_reports_to as (

    select
        unioned_worker_reports_to.reports_to_worker_id,

        {{ join_snapshots(
            cte_join = 'work_assignment_history',
            cte_join_valid_to = 'assignment_valid_to',
            cte_join_valid_from = 'assignment_valid_from',
            cte_join_on = 'unioned_worker_reports_to',
            cte_join_on_valid_to = 'reports_to_valid_to',
            cte_join_on_valid_from = 'reports_to_valid_from',
            cte_join_id = 'worker_assignment_id'
        ) }}

),

final as (

    select
        worker_assignment_id,
        worker_id,
        position_id,
        reports_to_worker_id,

        job_acronym,
        job_title,
        is_management_position,
        is_worker_outside_of_usa,
        assignment_status,
        assignment_status_reason,

        add_unioned_worker_reports_to_valid_from as valid_from,
        -- Cast future proof date back to null to keep dbt-onic
        case
            when add_unioned_worker_reports_to_valid_to = '{{ var("future_proof_date") }}'
                then null
            else add_unioned_worker_reports_to_valid_to
        end as valid_to
    
    from join_reports_to
    -- Removes records where multiple changes happened in one day
    where valid_from != ifnull(valid_to, '{{ var("future_proof_date") }}')

)

select * from final
