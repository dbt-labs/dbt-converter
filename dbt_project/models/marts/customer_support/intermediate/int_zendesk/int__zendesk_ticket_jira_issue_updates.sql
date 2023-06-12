with updates as (

    select * from {{ ref('stg_jira__issue_field_histories') }}
    where field_name = 'Zendesk Ticket IDs'

),

-- prepare arrays to diff the Zendesk ticket from the previous issue update
-- one row per Jira issue
updates_formatted as (

    select
        issue_id,
        updated_at,
        field_value,
        row_number() over (partition by issue_id order by updated_at) as n_zendesk_ticket_change,
        regexp_substr_all(
            ifnull(field_value, ''), -- using empty string if null to get an empty array & be able to compare
            '\\d+' -- substract all numeric strings (ticket IDs) from list
        ) as ticket_id_array,
        ifnull(
            lag(ticket_id_array) over (partition by issue_id order by updated_at),
            array_construct() -- using null array if first value to be able to compare arrays
        ) as prev_ticket_id_array,
        array_except(ticket_id_array, prev_ticket_id_array) as new_ticket_id_array,
        array_except(prev_ticket_id_array, ticket_id_array) as removed_ticket_id_array
    
    from updates
    -- filter out non-ticket ID values
    where field_value rlike '[0-9, ]*' or field_value is null

),

-- create one row per Zendesk ticket addition/removal to a Jira issue
updates_flattened as (

    select
        
        coalesce(new_tickets.value, removed_tickets.value)::varchar as ticket_id,
        issue_id::varchar as issue_id,
        updated_at,
        case
            when new_tickets.value is not null
                then 'addition'
            when removed_tickets.value is not null
                then 'removal'
        end as update_type,
        row_number() over (partition by ticket_id order by updated_at) as n_ticket_jira_update
        
    from updates_formatted
    left join lateral flatten(new_ticket_id_array, outer => true) as new_tickets
    left join lateral flatten(removed_ticket_id_array, outer => true) as removed_tickets
    where
        -- remove Jira issue creation update for Zendesk ticket where none is linked
        not(n_zendesk_ticket_change = 1 and field_value is null)
        -- remove edge cases where value was updated but no valid ID was set/removed
        -- example: previous values were not correctly formatted and value was set to null
        -- another example: comma was added with no new ID 
        --   (we want to make sure that we still catch new IDs with trailing commas)
        and ticket_id is not null

)

select * from updates_flattened