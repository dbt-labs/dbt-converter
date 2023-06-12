with

source as (

    select * from raw.fivetran_netsuite_suiteanalytics.transactionline
    where _fivetran_deleted = false
    
),

renamed as (

    select
        -- ids
        transaction as transaction_id,
        id as transaction_line_id,
        department as department_id,
        entity as entity_id,
        expenseaccount as expense_account_id,
        item as item_id,
        subsidiary as subsidiary_id,

        -- dimensions
        documentnumber as document_number,
        accountinglinetype as accounting_line_type,
        itemtype as item_type,
        linesequencenumber as line_sequence_number,
        memo,
        try_to_boolean(isbillable) as is_billable,
        try_to_boolean(isclosed) as is_closed,
        try_to_boolean(iscogs) as is_cogs,
        try_to_boolean(cleared) as is_cleared,
        try_to_boolean(isrevrectransaction) as is_rev_rec_transaction,
        try_to_boolean(taxline) as is_tax_line,        
        try_to_boolean(mainline) as is_main_line,

        -- measures
        creditforeignamount as foreign_currency_credit_amount,
        debitforeignamount as foreign_currency_debit_amount,
        foreignamount as foreign_currency_amount,
        foreignamountpaid as foreign_currency_amount_paid,
        foreignamountunpaid as foreign_currency_amount_unpaid,
        fxamountlinked as fx_amount_linked,
        netamount as foreign_currency_net_amount,
        quantity,

        -- date/times
        to_date(cleareddate) as cleared_date,
        to_date(closedate) as close_date,
        linelastmodifieddate as line_last_modified_at,
        custcol_suitesync_rev_rec_start::date as rev_rec_start_date,
        custcol_suitesync_rev_rec_end::date as rev_rec_end_date,        

        -- metadata
        _fivetran_synced   

    from source

)

select * from renamed