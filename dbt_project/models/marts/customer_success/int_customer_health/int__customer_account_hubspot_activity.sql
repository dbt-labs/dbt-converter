with hubspot_activity as (

    select *
    from {{ ref('hubspot__contacts') }}
    --only grab contacts that we've reached out to successfully
    where
        total_unique_deliveries > 0
        and is_contact_deleted = false
),

campaigns as (

    -- this cte is used to tie the contact to their Salesforce account
    select distinct
        account_id,
        contact_id
    from {{ ref('fct_campaign_members') }}
    -- filter out where we can't match a contact to an account
    where   
        account_id is not null
),

calcs as (

    select 
        campaigns.account_id as salesforce_account_id,
        sum(hubspot_activity.total_unique_deliveries) as total_unique_delivery_count,
        sum(hubspot_activity.total_unique_opens) as total_unique_open_count,
        total_unique_open_count/nullif(total_unique_delivery_count,0) as hubspot_open_rate
    from hubspot_activity
        inner join campaigns on 
            hubspot_activity.salesforce_contact_id = campaigns.contact_id
    group by
     1

)

select *
from calcs
