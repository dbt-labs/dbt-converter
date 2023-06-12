with source as (

    select * from {{ ref('stg_trello_cards') }}

),

renamed as (

    select
        card_id,
        labels.value['color']::varchar as color,
        labels.value['name']::varchar as name,
        labels.index as card_label_number

    from source,
    lateral flatten (input => source.labels) labels

),

with_id as (
    
    select 
        {{ dbt_utils.generate_surrogate_key([
            'card_id', 
            'card_label_number'
        ]) }} as id,
        *
    from renamed
    
)

select * from with_id