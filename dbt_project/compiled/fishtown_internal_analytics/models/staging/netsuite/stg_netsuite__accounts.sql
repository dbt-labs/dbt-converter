with

source as (

    select * from raw.fivetran_netsuite_suiteanalytics.account
    where _fivetran_deleted = false
    
),

renamed as (

    select
        --ids
        id as account_id,
        parent as parent_account_id,
        accttype as account_type_id,

        -- dimensions
        acctnumber as account_number,
        accountsearchdisplayname as account_search_display_name_long,
        accountsearchdisplaynamecopy as account_search_display_name_short, 
        displaynamewithhierarchy as account_display_name_with_hierarchy,
        fullname as account_full_name,
        cashflowrate as cash_flow_consolidated_currency_exchange_rate_type,
        generalrate as general_consolidated_currency_exchange_rate_type,
        try_to_boolean(inventory) as is_inventory,
        try_to_boolean(isinactive) as is_inactive,
        try_to_boolean(issummary) as is_summary,

        -- metadata
        _fivetran_synced

    from source

)

select * from renamed