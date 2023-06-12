with

credit_notes as (

    select * from {{ ref('stg_salesforce__credit_notes') }}

), 

accounts as (

    select * from {{ ref('stg_salesforce__accounts') }}

), 

enriched as (

    select
        credit_notes.*,
        accounts.account_name
        
    from credit_notes
    left join accounts
        on credit_notes.sfdc_account_id = accounts.account_id

)

select * from enriched