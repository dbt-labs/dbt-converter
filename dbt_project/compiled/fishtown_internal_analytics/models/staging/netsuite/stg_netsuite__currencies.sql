with

source as (

    select * from raw.fivetran_netsuite_suiteanalytics.currency
    where _fivetran_deleted = false
    
),

renamed as (

    select
        --ids
        id as currency_id,

        -- dimensions
        name as currency_code,
        currencyprecision as currency_precision,
        displaysymbol as currency_display_symbol,
        exchangerate as current_exchange_rate,
        try_to_boolean(isbasecurrency) as is_base_currency,
        try_to_boolean(isinactive) as is_inactive,

        -- metadata
        _fivetran_synced

    from source

)

select * from renamed