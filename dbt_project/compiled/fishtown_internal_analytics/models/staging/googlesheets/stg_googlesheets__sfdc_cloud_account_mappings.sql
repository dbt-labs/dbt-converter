with

source as (

    select * from raw.fivetran_googlesheets.sfdc_account_to_cloud_mappings

),

renamed as (

    select
        cloud_account_id,
        og_salesforce_account_id,
        salesforce_account_id,
        stripe_customer_id,
        cloud_account_name,
        deployment,
        plan,
        database_source,
        created_at::timestamp_ntz as cloud_account_created_at

    from source

)

select * from renamed