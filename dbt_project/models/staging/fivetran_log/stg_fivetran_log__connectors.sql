with source as (

    select * from {{ source('fivetran_log','connector') }}

),

renamed as (

    select
        connector_id,
        connecting_user_id,
        connector_type_id,
        destination_id,
        connector_name,
        paused as is_paused,
        sync_frequency,
        signed_up as connector_created_at
    
    from source
 
)

select * from renamed