with

credit_notes as (
    
    select * from {{ ref('int__salesforce_credit_notes') }}
    
)

select * from credit_notes