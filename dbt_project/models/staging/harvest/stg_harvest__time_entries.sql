with source as (

    select * from {{ source('harvest', 'time_entries') }}

),

renamed as (

    select
    
        id as time_entry_id,
        project_id,
        client_id,
        task_assignment_id,
        task_id,
        user_assignment_id,
        user_id,
        external_reference_id,

        hours,
        billable as is_billable,
        budgeted = 1 as is_budgeted,
        is_billed,
        is_closed,
        is_locked,
        is_running,
        locked_reason,
        notes,

        spent_date::timestamp_ntz as spent_at,
        created_at::timestamp_ntz as created_at,
        updated_at::timestamp_ntz as updated_at

    from source

)

select * from renamed