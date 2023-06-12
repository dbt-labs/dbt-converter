with

lines as (

    select * from {{ref('stg_quickbooks__invoice_lines')}}

),

parsing_dates as (

--For USAA 

    select
        invoice_line_id,
        invoice_id,
        quickbooks_customer_id,
        salesforce_account_id,
        stripe_customer_id,
        quickbooks_account,
        doc_number,
        quickbooks_customer_name,
        is_open_invoice,
        is_professional_services_item,
        is_sales_tax_line_item,

--USAA had an unusual renewal/expand invoice where their contract
--was expanded in May 2021 and then renewed in June 2021 (as expected).
--We had to correct the existing invoice and create a synthetic row
--(seen in the next CTE) to properly account for their MRR change.
--We could not correct this in QB as the invoice was already sent
--and it would take an extended period of time to correct again.
--This is fine moving forward as we're moving to Salesforce CPQ
--To understand the breakdown, please reference:
--https://docs.google.com/spreadsheets/d/1xJvH_vcI2-JIWFxPBLUxmO12Fp3jp4zoy5tn40wnLNA/
        case
            when invoice_id = '9553a47ba1380de10d0522cc592591b6'
                then 1371750::numeric
            else amount
        end as amount,

        transaction_type,

        case
            when invoice_id = '9553a47ba1380de10d0522cc592591b6'
                then 'dbt Cloud Enterprise: 12 months (7/27/2021 - 7/27/2022)'
            else description
        end as description_full,

        trim(split_part(lower(description),':',1)) as description,

        case
            when transaction_type in ('self-service','enterprise','snowplow')
                then to_date(trim(split_part(split_part(
                    lower(description_full), '(', 2
                    ), ' - ', 1)), 'mm/dd/yyyy')
        end as start_date,

        case
            when transaction_type in ('self-service','enterprise','snowplow')
                then to_date(trim(split_part(split_part(
                    lower(description_full), ')', 1
                    ), ' - ', 2)), 'mm/dd/yyyy')
        end as end_date,

        created_at::date as invoice_date,
        created_at

    from lines
    where amount > 0 
        --remove wonky historical invoice lines

),

usaa_expansion_correction as (
    --creating the synthetic "renewal" invoice for USAA (5/21 - 7/21)
    select
        invoice_line_id || ': expansion correction' as invoice_line_id,
        invoice_id || ': expansion correction' as invoice_id,
        quickbooks_customer_id,
        salesforce_account_id,
        stripe_customer_id,
        quickbooks_account,
        doc_number,
        quickbooks_customer_name,
        is_open_invoice,
        is_professional_services_item,
        is_sales_tax_line_item,
        196075::numeric as amount,
        transaction_type,
        'dbt Cloud Enterprise: 2 months (5/27/2021 - 7/27/2021)' as description_full,
        description,
        '5/27/2021'::date as start_date,
        '7/27/2021'::date as end_date,
        invoice_date,
        created_at        

    from parsing_dates
    where invoice_id = '9553a47ba1380de10d0522cc592591b6'

),

unioned as (

    select * from parsing_dates
    union all
    select * from usaa_expansion_correction

)

select * from unioned
