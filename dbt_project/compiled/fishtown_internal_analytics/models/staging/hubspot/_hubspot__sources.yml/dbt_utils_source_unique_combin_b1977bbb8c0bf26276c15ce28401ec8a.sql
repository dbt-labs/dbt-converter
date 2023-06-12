





with validation_errors as (

    select
        campaign_id, marketing_email_id
    from raw.fivetran_hubspot.marketing_email_campaign
    group by campaign_id, marketing_email_id
    having count(*) > 1

)

select *
from validation_errors


