with emails as (

    select * from {{ ref('hubspot__email_sends') }}
    where is_contact_deleted = false

),

campaigns as (

    select * from {{ ref('stg_hubspot__marketing_campaigns') }}

),

distinct_campaigns as (

    select distinct
        campaign_id,
        parent_campaign_id,
        parent_campaign_name,
        email_type
    
    from campaigns

),

joined as (

    select
        emails.*,
        distinct_campaigns.parent_campaign_id as parent_campaign_id,
        distinct_campaigns.parent_campaign_name,
        replace(initcap(distinct_campaigns.email_type),'_',' ') as campaign_type,

        --The below logic takes the latest step from our email engagement and lists it as their status. This aligns with Salesforce's native campaign member status.
        case
            when emails.was_clicked = true then 'Clicked Through Email'
            when emails.was_opened = true then 'Opened Email'
            when emails.was_delivered = true then 'Delivered Email'
            else 'Sent Email'
        end as status


    from emails
    left join distinct_campaigns
        on emails.email_campaign_id = distinct_campaigns.campaign_id

)

select * from joined
