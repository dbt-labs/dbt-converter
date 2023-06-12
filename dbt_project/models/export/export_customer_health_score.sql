with customer_health_score as (

    select * from {{ ref('rpt_customer_health_score') }}

)

select * from customer_health_score
--for now we're only feeding managed customers back into Salesforce
--There are some duplicated Salesforce Account IDs in self-service that will be fixed
--before we load them back in
where
    sales_motion = 'Managed'