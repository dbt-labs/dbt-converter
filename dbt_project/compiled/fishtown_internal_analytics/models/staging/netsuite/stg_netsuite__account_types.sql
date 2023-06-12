with

source as (

    select * from raw.fivetran_netsuite_suiteanalytics.accounttype
    where _fivetran_deleted = false
    
),

renamed as (

    select
        --ids
        id as account_type_id,

        -- dimensions
        longname as account_type_name,
        try_to_boolean(balancesheet) as is_balance_sheet_account,
        case
            when account_type_name in ('Income', 'Other Income') then true
            else false
        end as is_income_account,
        case
            when account_type_name in ('Expense', 'Other Expense', 'Cost of Goods Sold') then true
            else false
        end as is_expense_account,
        case
            when is_income_account = true or is_expense_account = true then true
            else false
        end as is_income_statement_account,
        defaultcashflowratetype as default_cash_flow_consolidated_currency_exchange_rate_type,
        defaultgeneralratetype as default_general_consolidated_currency_exchange_rate_type,
        
        -- metadata
        _fivetran_synced

    from source

)

select * from renamed