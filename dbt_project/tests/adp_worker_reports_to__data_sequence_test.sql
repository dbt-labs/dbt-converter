with worker_reports_to as (

    select * from {{ ref('stg_adp__worker_reports_to') }}

),

test as (

    select
        *,
        lead(reports_to_valid_from) over (
            partition by
                worker_assignment_id,
       		    worker_id
            order by reports_to_valid_from, reports_to_valid_to
        ) as next_reports_to_valid_from
    
    from worker_reports_to

)

select * from test
where next_reports_to_valid_from != reports_to_valid_to and next_reports_to_valid_from is not null