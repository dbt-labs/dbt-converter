with

source as (

    select * from raw.fivetran_netsuite_suiteanalytics.accountingperiod
    where _fivetran_deleted = false
    
),

renamed as (

    select
        --ids
        id as accounting_period_id,
        parent as parent_accounting_period_id,

        -- dimensions
        periodname as accounting_period_name,
        try_to_boolean(isadjust) as is_adjust,
        try_to_boolean(isinactive) as is_inactive,
        try_to_boolean(isposting) as is_posting,
        try_to_boolean(isquarter) as is_quarter,
              
        -- date/times
        to_date(startdate) as accounting_period_start_date,
        to_date(enddate) as accounting_period_end_date,

        -- metadata
        _fivetran_synced

    from source

)

select * from renamed