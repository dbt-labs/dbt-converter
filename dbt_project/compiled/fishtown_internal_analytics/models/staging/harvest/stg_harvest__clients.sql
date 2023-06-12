with source as (

    select * from raw.stitch_harvest.clients
    -- removing hard deleted clients as the Stitch connector does not bring in `is_deleted`/removes hard deletes.
    where id not in (
        '13392375'
    )

),

renamed as (

    select

        id as client_id,
        
        name as client_name,
        nullif(address, '') as salesforce_account_id,
        currency,
        is_active,
        case 
            when client_name in ('_Templates', 'dbtTest1', 'Ilan Test Client', 'COAP TEST CLIENT') 
                then true
            else false
        end as is_test_client,
        
        created_at,
        updated_at

    from source

)

select * from renamed