with

source as (

    select * from raw.fivetran_netsuite_suiteanalytics.currencyrate
    where _fivetran_deleted = false

),

renamed as (

    select
        --ids
        id as currency_rate_id,
        basecurrency as base_currency_id,
        transactioncurrency as transaction_currency_id,

        -- dimensions
        exchangerate as exchange_rate,

        -- date/times
        to_date(effectivedate) as effective_date,
        lastmodifieddate as last_modified_at,
        
        -- metadata
        _fivetran_synced

    from source

)

select * from renamed