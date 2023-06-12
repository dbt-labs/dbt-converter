with

source as (

    select * from {{ ref('fct_accounting_transaction_lines') }}
    where is_income_statement_account = true
),

posting as (

    select * from source where is_transaction_posting = True

),

income_statement_amounts as (
    
    select
        * exclude (
            cash_flow_consolidated_currency_exchange_rate,
            consolidated_cash_flow_amount,
            consolidated_cash_flow_credit_amount,
            consolidated_cash_flow_debit_amount,
            consolidated_cash_flow_net_amount,
            foreign_currency_amount,
            foreign_currency_net_amount,
            subsidiary_currency_amount,
            subsidiary_currency_net_amount,
            consolidated_general_rate_amount,
            consolidated_general_rate_net_amount
        ),

        -- measures
        case
            when is_income_account = true
                then -1 * foreign_currency_amount
            else foreign_currency_amount
        end as foreign_currency_account_level_amount,
        case
            when is_income_account = true
                then -1 * subsidiary_currency_amount
            else subsidiary_currency_amount
        end as subsidiary_currency_account_level_amount,
        case
            when is_income_account = true
                then -1 * consolidated_general_rate_amount
            else consolidated_general_rate_amount
        end as consolidated_general_rate_account_level_amount,
        -1 * foreign_currency_amount as foreign_currency_net_income_amount,
        -1 * subsidiary_currency_amount as subsidiary_currency_net_income_amount,
        -1 * consolidated_general_rate_amount as consolidated_general_rate_net_income_amount

    from posting

)

select * from income_statement_amounts
