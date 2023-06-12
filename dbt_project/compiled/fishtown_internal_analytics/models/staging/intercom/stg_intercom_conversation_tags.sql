with 

 __dbt__cte__base__intercom_conversations as (


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
),source as (

    select * from __dbt__cte__base__intercom_conversations

),

flattened as (
    
    select distinct 

        ticket_id, 
        tags.value['id']::int as tag_id,
        lower(tags.value['name']::varchar) as tag_name
    
    from source,
    
    lateral flatten (input => tags) tags

),

parse_tag_category as (

    select
        *,
        regexp_substr(tag_name, '\\[(.*?)\\]', 1, 1, 'e') as tag_category,
        split_part(tag_name, '-', 2) as tag_subcategory

    from flattened        

),

final as (
    
    select
        
    
md5(cast(coalesce(cast(ticket_id as TEXT), '') || '-' || coalesce(cast(tag_id as TEXT), '') as TEXT)) as id,
        *
    from parse_tag_category
    
)

select * from final