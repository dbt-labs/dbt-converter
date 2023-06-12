with

source as (

    select * from raw.fivetran_netsuite_suiteanalytics.transactionstatus
    where _fivetran_deleted = false
    
),

renamed as (

    select
        -- ids
        id as transaction_status_id,
        trantype as transaction_type_id,

        -- dimensions
        name as transaction_status_name,
        fullname as trasnaction_status_type_and_name,

        --- metadata
        _fivetran_id,
        _fivetran_synced  

    from source

)

select * from renamed