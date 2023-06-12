with

source as (

    select * from {{ ref('adp_worker_base_remuneration_snapshot') }}

),

exceptions as (

    select * from {{ ref('adp_worker_base_remuneration_snapshot_exceptions') }}

),

reflecting_exceptions as (

    select 
        source.* 

    from source 
    left join exceptions
        on source.worker_assignment_id = exceptions.worker_assignment_id
        and source.annual_rate_amount_currency_code = exceptions.annual_rate_amount_currency_code
    where exceptions.worker_assignment_id is null

)

select * from reflecting_exceptions