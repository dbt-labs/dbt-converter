with

source as (

    select * from {{ ref('adp_worker_report_to_snapshot') }}

),

renamed as (

    select
        worker_assignment_id,
        worker_id,
        report_to_worker_id as reports_to_worker_id,

        dbt_valid_from::date as reports_to_valid_from,
        
        -- Cast null `valid_to` dates to deep-future for min/maxing
        case
            when dbt_valid_to is null
                then '{{ var("future_proof_date") }}'
            else dbt_valid_to::date
        end as reports_to_valid_to,

        lag(reports_to_worker_id) over (
        	partition by worker_assignment_id,
       			worker_id
            order by reports_to_valid_from, reports_to_valid_to
        ) as prev_report_to_worker_id

    from source

),

flag_and_group as (

	select
        worker_assignment_id,
   		worker_id,
        reports_to_worker_id,

        reports_to_valid_from, 
        reports_to_valid_to,
        prev_report_to_worker_id,

        case
        	when reports_to_worker_id = prev_report_to_worker_id
                then 0
            else 1
       	end as change_flag,

        -- creating a rank for each assignment x worker x report batch
        sum(change_flag) over (
        	partition by worker_assignment_id,
       			worker_id,
            	reports_to_worker_id
            order by reports_to_valid_from, reports_to_valid_to
        ) as worker_report_rank

    from renamed

),

collapse_records as (

	select distinct
        worker_assignment_id,
        worker_id,
        reports_to_worker_id,

        first_value(reports_to_valid_from) over (
        	partition by worker_assignment_id,
       			worker_id,
            	reports_to_worker_id,
                worker_report_rank
            order by reports_to_valid_from
        ) as reports_to_valid_from,

        last_value(reports_to_valid_to) over (
        	partition by worker_assignment_id,
       			worker_id,
            	reports_to_worker_id,
                worker_report_rank
            order by reports_to_valid_to
        ) as reports_to_valid_to

    from flag_and_group

),

final as (

    select
        worker_assignment_id,
        worker_id,
        reports_to_worker_id,

        case
            when row_number() over (
                partition by worker_assignment_id,
                worker_id
                order by reports_to_valid_from, reports_to_valid_to
            ) = 1
                then true
            else false
        end as is_first_reports_to,

        case
            when reports_to_valid_to = '{{ var("future_proof_date") }}'
                then true
            else false
        end as is_current_reports_to,

        reports_to_valid_from,
        reports_to_valid_to  -- Future proof'd date is most recent record
    
    from collapse_records

)

select * from final
