with

source as (

    select * from {{ ref('int_adp_worker_base_remuneration_snapshot_adj') }}

),

work_assignment_history as (

    select distinct worker_assignment_id from {{ ref('stg_adp__work_assignment_history') }}

),

remove_invalid_work_assignments as (

    select
        source.*

    from source
    inner join work_assignment_history
        on source.worker_assignment_id = work_assignment_history.worker_assignment_id
),

deduplicated_annual_amounts as (

    select
        worker_assignment_id,
        worker_id,

        annual_rate_amount_amount_value as annual_amount,
        annual_rate_amount_currency_code as currency,

        effective_date::date as annual_amount_valid_from
        
    from remove_invalid_work_assignments
    group by 1, 2, 3, 4, 5
    
),

lagged as (

    select
        worker_assignment_id,
        worker_id,

        annual_amount,
        currency,

        annual_amount_valid_from,

        min(annual_amount_valid_from) over (partition by worker_assignment_id, worker_id) as first_annual_amount_started_at,
        max(annual_amount_valid_from) over (partition by worker_assignment_id, worker_id) as current_annual_amount_started_at,
        lead(annual_amount_valid_from, 1, '{{ var("future_proof_date") }}') over (
        	partition by worker_assignment_id,
       			worker_id
            order by annual_amount_valid_from asc
        ) as annual_amount_valid_to

    from deduplicated_annual_amounts

),

final as (

    select 
        worker_assignment_id,
        worker_id,

        annual_amount,
        currency,

        case
            when first_annual_amount_started_at = annual_amount_valid_from
                then true
            else false
        end as is_first_annual_amount,
        case
            when current_annual_amount_started_at = annual_amount_valid_from
                then true
            else false
        end as is_current_annual_amount,

        annual_amount_valid_from,
        annual_amount_valid_to

    from lagged

)

select * from final