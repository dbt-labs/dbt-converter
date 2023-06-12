with source as (

    select * from raw.trello.cards

),

renamed as (

    select
        source.id as card_id,
        labels.value['color']::varchar as color,
        labels.value['name']::varchar as name,
        labels.index as card_label_number
    from source,
    lateral flatten (input => source.labels) labels

),

with_id as (
    
    select 
        
    
md5(cast(coalesce(cast(card_id as TEXT), '') || '-' || coalesce(cast(card_label_number as TEXT), '') as TEXT)) as id,
        *
    from renamed
    
)

select * from with_id