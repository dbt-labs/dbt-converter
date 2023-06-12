with 

source as (

    select * from {{ref('base__intercom_conversations')}}

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
        {{  dbt_utils.generate_surrogate_key(['ticket_id','tag_id']) }} as id,
        *
    from parse_tag_category
    
)

select * from final
