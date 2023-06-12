with

source as(
    
    select * from {{ source("greenhouse", "job_opening") }}
    
),

final as (

    select
        id as job_opening_id,
        job_id,
        custom_position_id as finance_job_id,
        application_id,
        opened_at,
        closed_at,
        status as job_opening_status,
        custom_reason_for_hire as job_opening_reason,
        custom_hiring_manager as job_opening_hiring_manager,

        case
            when lower(custom_position_id) in ('tbd','template','00000')
                then true
            when lower(custom_position_id) like '%migration%'
                then true
            when lower(custom_position_id) like '%xxxx%'
                then true
            when lower(custom_position_id) like '%test%'
                then true
            when len(custom_position_id) < 8
                then true
            when coalesce(custom_position_id,'null') = 'null'
                then true
            when sum(
                case
                    when job_opening_status != 'closed'
                        then 1
                    else 0
                end
            ) over(partition by custom_position_id) > 1
                then true
            else false 
        end as job_id_error

    from source

)

select * from final