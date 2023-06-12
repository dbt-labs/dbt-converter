with

marketing_email_campaigns as (

    select * from {{ ref('base__hubspot_marketing_email_campaigns') }}

), 

marketing_emails as (

    select * from {{ ref('base__hubspot_marketing_emails') }}

),

joined as (

    select
        marketing_email_campaigns.campaign_id,
        marketing_emails.*

    from marketing_email_campaigns
    left join marketing_emails using (marketing_email_id)

)

select * from joined