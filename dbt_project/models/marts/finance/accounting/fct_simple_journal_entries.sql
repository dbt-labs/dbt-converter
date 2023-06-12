with

accounting_activity as (

    select * from {{ ref('fct_managed_accounting_activity') }}

),

subselect as (

    select

        id as accounting_activity_id,
        revenue_schedule_code,
        order_number,
        order_item_number,
        date_day,
        applicable_month_end,
        recognized_amount,
        rev_rec_debit,
        rev_rec_credit,
        invoiced_amount,
        invoice_debit,
        invoice_credit,
        tax_amount,
        account_name as salesforce_account_name

    from accounting_activity
),

rev_rec_unpivot as (

    select
        accounting_activity_id,
        revenue_schedule_code,
        order_number,
        order_item_number,
        date_day,
        applicable_month_end,
        recognized_amount as amount,
        lower(
              split_part(entry_type_raw,'_',3)
        ) as entry_type,
        'Revenue Recognition' as process_group,
        account,
        salesforce_account_name

    from subselect
        unpivot(account FOR entry_type_raw IN (rev_rec_debit,rev_rec_credit))
    where recognized_amount != 0 and recognized_amount is not null

),

acct_rec_debt_unpivot as (

    select
        accounting_activity_id,
        revenue_schedule_code,
        order_number,
        order_item_number,
        date_day,
        applicable_month_end,
        coalesce(invoiced_amount,0) + coalesce(tax_amount,0) as amount,
        lower(
              split_part(entry_type_raw,'_',2)
        ) as entry_type,
        'Accounts Receivable' as process_group,
        account,
        salesforce_account_name

    from subselect
        unpivot(account FOR entry_type_raw IN (invoice_debit))
    where amount != 0 and amount is not null

),

acct_rec_credit_unpivot as (

    select
        accounting_activity_id,
        revenue_schedule_code,
        order_number,
        order_item_number,
        date_day,
        applicable_month_end,
        coalesce(invoiced_amount,0) as amount,
        lower(
              split_part(entry_type_raw,'_',2)
        ) as entry_type,
        'Accounts Receivable' as process_group,
        account,
        salesforce_account_name

    from subselect
        unpivot(account FOR entry_type_raw IN (invoice_credit))
    where amount != 0 and amount is not null

),

acct_rec_credit_tax_unpivot as (

    select
        accounting_activity_id,
        revenue_schedule_code,
        order_number,
        order_item_number,
        date_day,
        applicable_month_end,
        coalesce(tax_amount,0) as amount,
        'credit' as entry_type,
        'Accounts Receivable' as process_group,
        '22800 Sales Tax Payable' as account,
        salesforce_account_name

    from subselect
    where amount != 0 and amount is not null

),

unioned as (

    select * from rev_rec_unpivot

    union all

    select * from acct_rec_debt_unpivot

    union all

    select * from acct_rec_credit_unpivot

    union all

    select * from acct_rec_credit_tax_unpivot

),

with_surrogate_key as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'accounting_activity_id',
            'process_group',
            'account'
         ]) }} as simple_journal_entry_id,
        *

    from unioned

)

select * from with_surrogate_key 