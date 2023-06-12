
    
    

select
    sfdc_credit_note_id as unique_field,
    count(*) as n_records

from analytics_dev.dbt_jstein.base__salesforce_credit_notes
where sfdc_credit_note_id is not null
group by sfdc_credit_note_id
having count(*) > 1


