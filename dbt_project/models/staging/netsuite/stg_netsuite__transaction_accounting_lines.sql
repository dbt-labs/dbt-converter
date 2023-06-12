with

source as (

    select * from {{ source('netsuite','transaction_accounting_line') }}
    where _fivetran_deleted = false
    
),

renamed as (

    select
        --ids
        transaction as transaction_id,
        transactionline as transaction_line_id,
        accountingbook as accounting_book_id,
        account as account_id,

        -- dimensions
        exchangerate as transaction_line_currency_exchange_rate,
        try_to_boolean(posting) as is_posting,

        -- measures
        amount as subsidiary_currency_amount,
        credit as subsidiary_currency_credit_amount,
        debit as subsidiary_currency_debit_amount,
        netamount as subsidiary_currency_net_amount,

        -- metadata
        _fivetran_synced

    from source

)

select * from renamed
