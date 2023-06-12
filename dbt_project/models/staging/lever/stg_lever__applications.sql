with source as (

    select * from {{ source('lever', 'application') }}

),

renamed as (

    select
        id as application_id,
        posting_id,
        opportunity_id,
        archived_reason_id,
        requisition_for_hire_id,
        posting_hiring_manager_id,
        posting_owner_id,
        referrer_id,

        type as application_type,

        requisition_for_hire_manager,
        requisition_for_hire_code,

        created_at,
        archived_at

    from source

)

select * from renamed
