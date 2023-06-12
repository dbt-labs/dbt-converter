with

tasks as (

    select * from {{ ref('stg_salesforce__tasks') }}
    where is_deleted = false

),

owners as (

    select * from {{ ref('stg_salesforce__owners') }}

),

subtypes_parsed as (

    select
        {{ dbt_utils.star(
            from=ref('stg_salesforce__tasks'),
            except=['TASK_SUBTYPE']
        )}},

        case
            when subject ilike 'Message sent from Sales Navigator%' then 'LinkedIn Sales Navigator'
            when subject ilike 'InMail sent from Sales Navigator%' then 'LinkedIn Sales Navigator'
            when subject ilike '%[Outreach]%' then 'Outreach'
            else 'Salesforce'
        end as task_data_source,

        case
            when task_data_source = 'LinkedIn Sales Navigator' then 'InMail'
            else task_subtype
        end as task_subtype
    
    from tasks

),

joined as (

    select
        subtypes_parsed.*,
        owners.role_name as owner_role_name,
        owners.owner_role_grouping
    
    from subtypes_parsed
    left join owners using (owner_id)

),

parsed as (

    select
        *,

        who_id as salesforce_contact_id,
        
        case
            when task_subtype = 'Email'
                and task_data_source = 'Salesforce'
                and mme_email_direction = 'Received'
                then 'Inbound'
            when task_subtype = 'Email'
                and task_data_source = 'Salesforce'
                and mme_email_direction = 'Sent'
                then 'Outbound'
            when task_subtype = 'Email'
                and task_data_source = 'Outreach'
                and subject ilike '%\\[in\\]%' escape '\\'
                then 'Inbound'
            when task_subtype = 'Email'
                and task_data_source = 'Outreach'
                and subject ilike '%\\[out\\]%' escape '\\'
                then 'Outbound'
            when task_subtype = 'Email' then email_direction
            when task_data_source = 'LinkedIn Sales Navigator' then 'Outbound'
            when task_subtype = 'Call' then call_type
            else null
        end as direction,

        case
            when task_data_source = 'Salesforce'
                and task_type = 'Email'
                and task_subtype = 'Email'
                and direction = 'Outbound'
                and owner_role_grouping = 'SDR'
                then 'SDR - MME - Email - Outbound'
            when task_data_source = 'Salesforce'
                and task_type = 'Email'
                and task_subtype = 'Email'
                and direction = 'Outbound'
                and owner_role_grouping = 'SD'
                then 'SD - MME - Email - Outbound'
            when task_data_source = 'Salesforce'
                and task_type = 'Email'
                and task_subtype = 'Email'
                then 'Unknown'
            else
                concat(
                    owner_role_grouping,
                    ' - ',
                    task_data_source,
                    ' - ',
                    task_subtype,
                    ' - ',
                    direction
                )
        end as task_details,

        case
            when task_data_source = 'Salesforce'
                and task_type = 'Task'
                and task_subtype = 'Task'
                then false
            when task_type = 'Task'
                and task_subtype = 'Call'
                then false
            when task_type is null
                and task_subtype = 'Task'
                then false
            when task_data_source = 'Salesforce'
                and task_type = 'Task'
                and task_subtype = 'Email'
                then false
            when task_data_source = 'Salesforce'
                and task_type = 'Meeting'
                and task_subtype = 'Call'
                then false
            when task_details = 'Unknown' then false
            when direction = 'Inbound' or direction is null then false
            when owner_role_grouping is null then false
            else true
        end as include_in_attribution
    
    from joined

)

select * from parsed


/*

NOTES:
    exclude
        data_source = 'Salesforce' and task_type = 'Task' and task_subtype = 'Task'
        task_type = 'Type' and task_subtype = 'Call'
        data_source = 'Salesforce' and task_type = 'Task' and task_subtype = 'Email'
        data_source = 'Salesforce' and task_type = 'Meeting' and task_subtype = 'Call'
    
    mark as unknown (but keep):
        task_type = 'Email' and task_subtype = 'Email' and direction is null

    task correction:
        if LinkedIn source, call task_subtype InMail
    */
