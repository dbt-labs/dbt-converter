with

reports_to as (

    select * from {{ ref('stg_adp__worker_reports_to') }}

),

name as (

    select * from {{ ref('stg_adp__person_history')}}

),

final as (

    select
        reports_to.worker_assignment_id,
        reports_to.worker_id,
        reports_to.reports_to_worker_id,

        name.preferred_first_name as reports_to_preferred_first_name,
        name.preferred_last_name as reports_to_preferred_last_name,
        name.preferred_name as reports_to_preferred_name,

        reports_to.is_first_reports_to,
        reports_to.is_current_reports_to,

        reports_to.reports_to_valid_from,
        reports_to.reports_to_valid_to
    from reports_to
    left outer join name
        on reports_to.reports_to_worker_id = name.worker_id

)

select * from final