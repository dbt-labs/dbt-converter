with

source as (

    select * from {{ source('lever', 'requisition') }}

),

renamed as (

    select

        id as requisition_id,
        creator_id,
        owner_id,
        hiring_manager_id,
        upper(replace(requisition_code, ' ', '')) as requisition_code,
        custom_field_cost_center as cost_center,
        status as requisition_status,
        name as requisition_name,
        team,
        location,

        headcount_total,
        headcount_hired,
        headcount_infinite::boolean as is_headcount_infinite,

        backfill,
        internal_notes,
        employment_status,
        created_at,
        closed_at,

        compensation_band_currency,
        compensation_band_interval,
        compensation_band_min,
        compensation_band_max,

        approval_id,
        approval_status,
        approval_started_at,
        approval_approved_at,
        approval_account_id,
        approval_created_by,
        _fivetran_deleted

    from source

)

select * from renamed