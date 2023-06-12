with

fields as (

    select distinct
        field,
        datatype
    
    from (select * from raw.salesforce.accounthistory where datatype != 'EntityId') dbt_subquery

),

validation_errors as (

    select
        field,
        count(*)       

    from fields
    group by 1
    having count(*) > 1

)

select * from validation_errors