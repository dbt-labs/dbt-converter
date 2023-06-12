with source as (

    select * from {{ source('harvest', 'users') }}

),

renamed as (

    select
    
        id as user_id,
        first_name,
        last_name,
        concat(first_name,last_name) as user_name,
        decode(
            concat_ws(' ', first_name, last_name), --value to search
            'Bethany Hipple', 'Beth Hipple', --decode logic
            concat_ws(' ', first_name, last_name) --default value
        ) as user_full_name,
        email,

        avatar_url,
        can_create_invoices,
        can_create_projects,
        can_see_rates,
        created_at,
        default_hourly_rate,
        has_access_to_all_future_projects,
        is_active,
        is_admin,
        is_contractor,
        is_project_manager,
        telephone,
        timezone,
        weekly_capacity,

        updated_at,
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed