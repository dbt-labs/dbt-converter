with source as (

    select * from {{ ref('stg_trello_cards') }}

),

renamed as (

    select
        card_id,
        members.value::varchar as member_id,
        members.index as card_member_number

    from source,
    lateral flatten (input => source.members) members

),

with_id as (
    
    select 
        {{ dbt_utils.generate_surrogate_key([
            'card_id', 
            'card_member_number'
        ]) }} as id,
        *
    from renamed
    
)

select * from renamed
