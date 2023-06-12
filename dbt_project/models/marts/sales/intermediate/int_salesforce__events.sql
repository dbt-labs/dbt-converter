with

events as (
    
    select * from {{ ref('stg_salesforce__events') }}
    where is_deleted = false

),

renamed as (

    select
        *,
        who_id as salesforce_contact_id
    
    from events

)

select * from renamed