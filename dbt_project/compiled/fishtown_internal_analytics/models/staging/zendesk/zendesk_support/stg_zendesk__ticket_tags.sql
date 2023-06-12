with 

source as (
    
    select * from raw.fivetran_zendesk.ticket_tag

),

renamed as (
    
    select
        
    
md5(cast(coalesce(cast(ticket_id as TEXT), '') || '-' || coalesce(cast(tag as TEXT), '') as TEXT)) as id,
        ticket_id, 
        
        tag as tag_name,
        case
            when tag_name ilike '%-%'
                then split_part(tag, '-', 1) 
            else null
        end as tag_category,
        case
            when tag_name ilike '%-%'
                then split_part(tag, '-', 2)
            else null
        end as tag_subcategory

    from source
    
)

select * from renamed