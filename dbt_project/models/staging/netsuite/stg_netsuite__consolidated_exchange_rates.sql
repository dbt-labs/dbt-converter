with

source as (

    select * from {{ source('netsuite','consolidated_exchange_rate') }}
    where _fivetran_deleted = false
    
),

renamed as (

    select
        --ids
        id as consolidated_exchange_rate_id,
        accountingbook as accounting_book_id,
        fromcurrency as from_currency_id,
        fromsubsidiary as from_subsidiary_id,
        tocurrency as to_currency_id,
        tosubsidiary as to_subsidiary_id,
        postingperiod as posting_accounting_period_id,

        -- measures
        averagerate as average_consolidated_currency_exchange_rate,
        currentrate as current_consolidated_currency_exchange_rate,
        historicalrate as historical_consolidated_currency_exchange_rate,
        
        -- metadata
        _fivetran_synced

    from source

)

select * from renamed