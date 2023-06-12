with 

transactions as (

    select * from {{ ref('stg_netsuite__transactions') }}

),

transaction_statuses as (

    select * from {{ ref('stg_netsuite__transaction_statuses') }}

),

accounting_periods as (

    select * from {{ ref('stg_netsuite__accounting_periods') }}

),

line_items as (

    select * from {{ ref('stg_netsuite__transaction_lines') }}

),

accounting_lines as (

    select * from {{ ref('stg_netsuite__transaction_accounting_lines') }}

),

accounts as (

    select * from {{ ref('stg_netsuite__accounts') }}

),

account_types as (

    select * from {{ ref('stg_netsuite__account_types') }}

),

currencies as (

    select * from {{ ref('stg_netsuite__currencies') }}

),

subsidiaries as (

    select * from {{ ref('stg_netsuite__subsidiaries') }}    

),

consolfxrates as (

    select * from {{ ref('stg_netsuite__consolidated_exchange_rates') }}

),

entities as (

    select * from {{ ref('stg_netsuite__entities') }}

), 

vendors as (

    select * from {{ ref('stg_netsuite__vendors') }}

),

departments as (

    select * from {{ ref('stg_netsuite__departments') }}

),

transactions_with_detail as (

    select
        transactions.*,
        transaction_statuses.transaction_status_name,
        accounting_periods.accounting_period_start_date,
        accounting_periods.accounting_period_end_date,
        currencies.currency_code,
        currencies.currency_display_symbol,
        entities.entity_type as transaction_entity_type,
        entities.entity_name as transaction_entity_name,
        entities.vendor_id as transaction_vendor_id,
        vendors.vendor_name as transaction_vendor_name
    from transactions
    inner join transaction_statuses
        on transactions.transaction_status_id = transaction_statuses.transaction_status_id
        and transactions.transaction_type_id = transaction_statuses.transaction_type_id
    inner join accounting_periods
        on transactions.posting_accounting_period_id = accounting_periods.accounting_period_id
    inner join currencies
        on transactions.transaction_currency_id = currencies.currency_id
    left outer join entities
        on transactions.entity_id = entities.entity_id
    left outer join vendors
        on entities.vendor_id = vendors.vendor_id

),

line_items_with_detail as (

    select
        line_items.*,
        accounting_lines.accounting_book_id,
        accounting_lines.account_id,
        accounting_lines.transaction_line_currency_exchange_rate,
        accounting_lines.is_posting,
        accounting_lines.subsidiary_currency_amount,
        accounting_lines.subsidiary_currency_credit_amount,
        accounting_lines.subsidiary_currency_debit_amount,
        accounting_lines.subsidiary_currency_net_amount,
        accounts.parent_account_id,
        accounts.account_type_id,
        accounts.cash_flow_consolidated_currency_exchange_rate_type,
        accounts.general_consolidated_currency_exchange_rate_type,
        accounts.account_number,
        accounts.account_search_display_name_long,
        accounts.account_search_display_name_short, 
        accounts.account_display_name_with_hierarchy,
        accounts.account_full_name,
        accounts.is_inventory,
        accounts.is_inactive,
        accounts.is_summary,
        account_types.account_type_name,
        account_types.is_balance_sheet_account,
        account_types.is_income_account,
        account_types.is_expense_account,
        account_types.is_income_statement_account,
        subsidiaries.subsidiary_currency_id,
        subsidiaries.parent_subsidiary_id,
        subsidiaries.parent_or_top_level_subsidiary_id,
        subsidiaries.subsidiary_country_code,
        subsidiaries.subsidiary_name,
        entities.entity_type as transaction_line_entity_type,
        entities.entity_name as transaction_line_entity_name,
        entities.vendor_id as transaction_line_vendor_id,
        vendors.vendor_name as transaction_line_vendor_name,
        departments.department_name,
        departments.parent_department_id,
        departments.department_name_with_parent_names
    from line_items
    inner join accounting_lines
        on line_items.transaction_id = accounting_lines.transaction_id
        and line_items.transaction_line_id = accounting_lines.transaction_line_id
    inner join accounts
        on accounting_lines.account_id = accounts.account_id
    inner join account_types
        on accounts.account_type_id = account_types.account_type_id
    inner join subsidiaries
        on line_items.subsidiary_id = subsidiaries.subsidiary_id
    left outer join departments
        on line_items.department_id = departments.department_id
    left outer join entities
        on line_items.entity_id = entities.entity_id
    left outer join vendors
        on entities.vendor_id = vendors.vendor_id

),

flat_table as (

    select
        
        -- ids
        transactions_with_detail.transaction_id,
        line_items_with_detail.transaction_line_id,
        transactions_with_detail.transaction_currency_id,
        transactions_with_detail.approval_status_id,
        transactions_with_detail.transaction_status_id,
        transactions_with_detail.posting_accounting_period_id,
        transactions_with_detail.entity_id as transaction_entity_id,
        line_items_with_detail.entity_id as transaction_line_entity_id,
        transactions_with_detail.reversal_transaction_id,
        transactions_with_detail.transaction_type_id,
        transactions_with_detail.transaction_vendor_id,
        transactions_with_detail.billing_address_id,
        transactions_with_detail.shipping_address_id,
        transactions_with_detail.transaction_created_by_id,
        transactions_with_detail.je_approved_by_id,
        transactions_with_detail.je_created_by_id,
        transactions_with_detail.trx_country_id,
        transactions_with_detail.stripe_invoice_id,
        line_items_with_detail.transaction_line_vendor_id,
        line_items_with_detail.department_id,
        line_items_with_detail.parent_department_id,
        line_items_with_detail.expense_account_id,
        line_items_with_detail.subsidiary_id,
        line_items_with_detail.accounting_book_id,
        line_items_with_detail.account_id,
        line_items_with_detail.parent_account_id,
        line_items_with_detail.account_type_id,
        line_items_with_detail.subsidiary_currency_id,
        line_items_with_detail.parent_subsidiary_id,
        line_items_with_detail.parent_or_top_level_subsidiary_id,
        consolfxrates.consolidated_exchange_rate_id,
        
        -- dimensions
        transactions_with_detail.memo as transaction_memo,
        line_items_with_detail.memo as transaction_line_memo,
        line_items_with_detail.accounting_line_type,
        transactions_with_detail.transaction_entity_type,
        line_items_with_detail.transaction_line_entity_type,
        transactions_with_detail.transaction_entity_name,
        line_items_with_detail.transaction_line_entity_name,
        line_items_with_detail.department_name,
        line_items_with_detail.department_name_with_parent_names,
        transactions_with_detail.transaction_vendor_name,
        line_items_with_detail.transaction_line_vendor_name,
        transactions_with_detail.transaction_status_name,
        transactions_with_detail.transaction_identifier,
        transactions_with_detail.transaction_identifier_display_name,
        transactions_with_detail.transaction_type_based_document_number,
        transactions_with_detail.record_type,
        transactions_with_detail.payment_account_based_number,
        transactions_with_detail.credit_card_brand,
        transactions_with_detail.itr_nexus,
        transactions_with_detail.contact_email,
        transactions_with_detail.currency_code as transaction_currency_code,
        transactions_with_detail.currency_display_symbol as transaction_currency_display_symbol,
        transactions_with_detail.transaction_currency_exchange_rate,
        line_items_with_detail.transaction_line_currency_exchange_rate,
        /* This additional information might be superfluous.  Removing for now */
        --consolfxrates.average_consolidated_currency_exchange_rate,
        --consolfxrates.current_consolidated_currency_exchange_rate,
        --consolfxrates.historical_consolidated_currency_exchange_rate,
        --line_items_with_detail.cash_flow_consolidated_currency_exchange_rate_type,
        --line_items_with_detail.general_consolidated_currency_exchange_rate_type,
        case
            when cash_flow_consolidated_currency_exchange_rate_type = 'AVERAGE'
                then average_consolidated_currency_exchange_rate
            when cash_flow_consolidated_currency_exchange_rate_type = 'HISTORICAL'
                then historical_consolidated_currency_exchange_rate
            else current_consolidated_currency_exchange_rate
        end as cash_flow_consolidated_currency_exchange_rate,
        case
            when general_consolidated_currency_exchange_rate_type = 'AVERAGE'
                then average_consolidated_currency_exchange_rate
            when general_consolidated_currency_exchange_rate_type = 'HISTORICAL'
                then historical_consolidated_currency_exchange_rate
            else current_consolidated_currency_exchange_rate
        end as general_consolidated_currency_exchange_rate,
        line_items_with_detail.is_posting as is_line_item_posting,
        line_items_with_detail.account_number,
        line_items_with_detail.account_search_display_name_long,
        line_items_with_detail.account_search_display_name_short, 
        line_items_with_detail.account_display_name_with_hierarchy,
        line_items_with_detail.account_full_name,
        line_items_with_detail.account_type_name,
        line_items_with_detail.subsidiary_country_code,
        line_items_with_detail.subsidiary_name,
        transactions_with_detail.is_intercompany_adjustment,
        transactions_with_detail.is_reversal,
        transactions_with_detail.is_posting as is_transaction_posting,
        transactions_with_detail.is_adjustment_journal,
        transactions_with_detail.is_cash_register,
        line_items_with_detail.is_billable,
        line_items_with_detail.is_closed,
        line_items_with_detail.is_cogs,
        line_items_with_detail.is_cleared,
        line_items_with_detail.is_rev_rec_transaction,
        line_items_with_detail.is_tax_line,        
        line_items_with_detail.is_main_line,
        line_items_with_detail.is_inventory,
        line_items_with_detail.is_inactive,
        line_items_with_detail.is_summary,
        line_items_with_detail.is_balance_sheet_account,
        line_items_with_detail.is_income_account,
        line_items_with_detail.is_expense_account,
        line_items_with_detail.is_income_statement_account,

        -- measures
        line_items_with_detail.foreign_currency_credit_amount,
        line_items_with_detail.foreign_currency_debit_amount,
        line_items_with_detail.foreign_currency_amount,
        line_items_with_detail.foreign_currency_amount_paid,
        line_items_with_detail.foreign_currency_amount_unpaid,
        line_items_with_detail.foreign_currency_net_amount,
        line_items_with_detail.subsidiary_currency_amount,
        line_items_with_detail.subsidiary_currency_credit_amount,
        line_items_with_detail.subsidiary_currency_debit_amount,
        line_items_with_detail.subsidiary_currency_net_amount,
        cash_flow_consolidated_currency_exchange_rate
            * line_items_with_detail.subsidiary_currency_amount as consolidated_cash_flow_amount,
        cash_flow_consolidated_currency_exchange_rate
            * line_items_with_detail.subsidiary_currency_credit_amount as consolidated_cash_flow_credit_amount,
        cash_flow_consolidated_currency_exchange_rate
            * line_items_with_detail.subsidiary_currency_debit_amount as consolidated_cash_flow_debit_amount,
        cash_flow_consolidated_currency_exchange_rate
            * line_items_with_detail.subsidiary_currency_net_amount as consolidated_cash_flow_net_amount,
        general_consolidated_currency_exchange_rate
            * line_items_with_detail.subsidiary_currency_amount as consolidated_general_rate_amount,
        general_consolidated_currency_exchange_rate
            * line_items_with_detail.subsidiary_currency_credit_amount as consolidated_general_rate_credit_amount,
        general_consolidated_currency_exchange_rate
            *line_items_with_detail.subsidiary_currency_debit_amount as consolidated_general_rate_debit_amount,
        general_consolidated_currency_exchange_rate
            * line_items_with_detail.subsidiary_currency_net_amount as consolidated_general_rate_net_amount,

        -- dates / times
        transactions_with_detail.accounting_period_start_date,
        transactions_with_detail.accounting_period_end_date,
        transactions_with_detail.transaction_date, 
        transactions_with_detail.close_date as transaction_close_date,
        transactions_with_detail.created_at as transaction_created_at,
        transactions_with_detail.created_date as transaction_created_date,
        line_items_with_detail.close_date as transaction_line_close_date,
        line_items_with_detail.rev_rec_start_date as transaction_line_rev_rec_start_date,
        line_items_with_detail.rev_rec_end_date as transaction_line_rev_rec_end_date,
        transactions_with_detail.reversal_date,
        line_items_with_detail.cleared_date
        
        
    from transactions_with_detail
    inner join line_items_with_detail
        on transactions_with_detail.transaction_id = line_items_with_detail.transaction_id
    inner join consolfxrates
        on line_items_with_detail.accounting_book_id = consolfxrates.accounting_book_id
        and transactions_with_detail.posting_accounting_period_id = consolfxrates.posting_accounting_period_id
        and line_items_with_detail.subsidiary_id = consolfxrates.from_subsidiary_id
        and line_items_with_detail.parent_or_top_level_subsidiary_id = consolfxrates.to_subsidiary_id

)

select * from flat_table













