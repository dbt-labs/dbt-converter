
    
    

with __dbt__cte__base__intercom_conversations as (


with 

source as (
    
    select * from raw.intercom_stitch.conversations

),

renamed as (

    
    select
    
        --ids
        id as ticket_id,
        source:author:id::varchar as submitter_id,
        assignee:id::int as assignee_id, 
        
        --dimensions
        type,
        'closed' as status,
        --we migrated from intercom 5/2021 - these should all be closed
        source:author:email::varchar as submitter_email,
        source:author:type::varchar as submitter_role,
        assignee:type::varchar as assignee_role,
        source:url::varchar as url,
        replace(replace(source:subject::varchar,'<p>'),'</p>') as subject,
        conversation_rating:rating::int as customer_rating,
        conversation_rating:remark::string as rating_remark,
        
        --boolean
        false as is_open,
        true as is_read,
        --we migrated from intercom 5/2021 - these should all be closed/read

        --variants
        tags,
        conversation_rating,
        
        --dates
        --convert timestamps to EST so we can calculate business hours properly
        convert_timezone('America/New_York', created_at)::timestamp_ntz 
            as created_at,
        convert_timezone('America/New_York',waiting_since)::timestamp_ntz
            as waiting_since,
        convert_timezone('America/New_York',snoozed_until)::timestamp_ntz
            as snoozed_until,
        convert_timezone('America/New_York', updated_at)::timestamp_ntz 
            as updated_at
        
    from source

)

select * from renamed
)select
    ticket_id as unique_field,
    count(*) as n_records

from __dbt__cte__base__intercom_conversations
where ticket_id is not null
group by ticket_id
having count(*) > 1


