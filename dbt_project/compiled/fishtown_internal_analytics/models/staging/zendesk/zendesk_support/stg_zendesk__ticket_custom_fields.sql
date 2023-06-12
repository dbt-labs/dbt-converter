with 

source as (
    
    select * from raw.fivetran_zendesk.ticket_custom_field

),

renamed as (
    
    select
        id::varchar as zendesk_custom_field_id,
        case 
            when title = 'Link to documentation/known issue' 
                then 'link_to_docs_or_issue'
            else title
        end as field_name

    from source
    
)

select * from renamed