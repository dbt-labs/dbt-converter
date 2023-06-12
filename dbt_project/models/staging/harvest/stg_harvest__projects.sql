{{
  config(
    materialized = "table"
  )
}}

with source as (

    select * from {{ source('harvest', 'projects') }}

),

renamed as (

    select
    
        id as project_id,
        client_id,
        name as project_name,

        bill_by,
        budget,
        budget_by,
        budget_is_monthly,
        nullif(code, '') as salesforce_opportunity_line_item_id,
        cost_budget,
        cost_budget_include_expenses,
        fee,
        hourly_rate,
        notes,
        notify_when_over_budget,
        over_budget_notification_percentage,
        show_budget_to_all,

        is_active,
        is_billable,
        is_fixed_fee,

        starts_on::timestamp_ntz as project_starts_on,
        ends_on::timestamp_ntz as project_ends_on,
        created_at,
        updated_at

    from source

)

select * from renamed