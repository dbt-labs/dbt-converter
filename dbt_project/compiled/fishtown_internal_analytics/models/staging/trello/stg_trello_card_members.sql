with source as (

    select * from raw.trello.cards

),

renamed as (

    select
        source.id as card_id,
        members.value::varchar as member_id,
        members.index as card_member_number
    from source,
    lateral flatten (input => source.idmembers) members

),

with_id as (
    
    select 
        
    
md5(cast(coalesce(cast(card_id as TEXT), '') || '-' || coalesce(cast(card_member_number as TEXT), '') as TEXT)) as id,
        *
    from renamed
    
)

select * from renamed