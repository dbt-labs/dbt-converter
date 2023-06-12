with

simple_journal_entries as (

    select * from {{ ref('fct_simple_journal_entries') }}

),

pivoted as (

    select 
        *

    from simple_journal_entries
        pivot(sum(amount) for entry_type in ('credit','debit'))

),

account_bucketing as (

    select
        date_day,
        applicable_month_end,
        process_group,
        account,
        round(sum(coalesce("'debit'",0)),2) as debit,
        round(sum(coalesce("'credit'",0)),2) as credit

    from pivoted
    group by 1,2,3,4

),

with_surrogate_key as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'date_day',
            'process_group',
            'account'
         ]) }} as compound_journal_entry_id,
        *

    from account_bucketing

)

select * from with_surrogate_key