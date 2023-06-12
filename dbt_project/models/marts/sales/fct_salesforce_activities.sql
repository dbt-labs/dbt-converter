with

events as (

    select * from {{ ref('int_salesforce__events') }}
    where event_type = 'Meeting'

),

tasks as (

    select * from {{ ref('int_salesforce__tasks') }}

),

owners as (

    select * from {{ ref('stg_salesforce__owners') }}

),

events_formatted as (

    select
        salesforce_event_id as activity_ref_id,
        account_id,
        created_by_id,
        last_modified_by_id,
        owner_id,
        salesforce_contact_id,
        'Events' as activity_source,
        event_type as activity_type,
        event_subtype as activity_subtype,
        location as activity_details,
        subject,
        description,
        'Outbound' as direction,
        activity_date,
        created_at,
        last_modified_at

    from events

),

tasks_formatted as (

    select
        salesforce_task_id as activity_ref_id,
        account_id,
        created_by_id,
        last_modified_by_id,
        owner_id,
        salesforce_contact_id,
        'Tasks' as activity_source,
        task_type as activity_type,
        task_subtype as activity_subtype,
        task_details as activity_details,
        subject,
        description,
        combined_email_direction as direction,
        activity_date,
        created_at,
        last_modified_at

    from tasks

),

unioned as (

    select * from events_formatted
    union all
    select * from tasks_formatted

),

joined as (

    select
        unioned.*,
        owners.role_name as owner_role_name,
        case
            when owners.role_name = 'Sales Director' then 'SD'
            when owners.role_name = 'Regional Director of Sales' then 'SD'
            when owners.role_name = 'Sales Development Rep' then 'SDR'
            when owners.role_name = 'Solutions Architect' then 'SA'
            when owners.role_name = 'Regional Director of Solutions Architecture' then 'SA'
            when owners.role_name = 'Head of Solutions Architecture' then 'SA'
        end as owner_role_grouping
    
    from unioned
    left join owners using (owner_id)

)

select * from joined