

with web_events as (

    select * from analytics_dev.dbt_jstein.int_snowplow_web_events

),

form_events as (

    select * from analytics_dev.dbt_jstein.int_web_form_emails

),

contacts as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__contacts
    where is_deleted = false

),

cloud_users as (

    select * from analytics_dev.dbt_jstein.stg_cloud__users

),

relevant_web_events as (

    select distinct
        domain_userid,
        user_id as cloud_user_id,
        null as email,
        collector_tstamp
    
    from web_events
    where domain_userid is not null
        and collector_tstamp is not null

),

unioned as (

    select
        domain_userid,
        cloud_user_id,
        email,
        collector_tstamp
    
    from relevant_web_events

    union all

    select
        domain_userid,
        cloud_user_id,
        email,
        collector_tstamp
    
    from form_events

),

-- the below logic prioritizes a users Cloud email over the email provided in a form fill
-- this helps us hone in on business emails, and it ensures we capture the email for users who are not Cloud users
cloud_joined as (

    select
        domain_userid,
        cloud_user_id,
        coalesce(
            cloud_users.email,
            unioned.email
        ) as email,
        collector_tstamp

    from unioned
    left join cloud_users
        on unioned.cloud_user_id = cloud_users.user_id

),

prep as (

    select distinct
        domain_userid,

        last_value(cloud_user_id) ignore nulls over (
            partition by domain_userid
            order by collector_tstamp
                rows between unbounded preceding
                and unbounded following
        ) as last_cloud_user_id,

        last_value(email) ignore nulls over (
            partition by domain_userid
            order by collector_tstamp
                rows between unbounded preceding
                and unbounded following
        ) as last_email,

        max(collector_tstamp) over (
            partition by domain_userid
        ) as max_tstamp

    from cloud_joined

),

contacts_joined as (

    select
        prep.domain_userid,
        prep.last_cloud_user_id as cloud_user_id,
        contacts.contact_id as salesforce_contact_id,
        prep.last_email as email,
        prep.max_tstamp
    
    from prep
    left join contacts on prep.last_email = contacts.email

),

final as (

    select
        -- the below logic prioritizes a users Cloud User ID for recognition

        -- the second ID to be used would be the users Salesforce Contact ID
        -- this allow us to stitch together domain_userids across non-Cloud users

        -- followed by the user_snowplow_domain_id
        -- only completely anonymous users should have a user_snowplow_domain_id as their inferred_user_id

        coalesce(
            cloud_user_id,
            salesforce_contact_id,
            domain_userid
        ) as inferred_user_id,

        *

    from contacts_joined
    -- ensure we're not duplicating domain_userid's
    qualify row_number() over (
         partition by domain_userid
         order by max_tstamp desc
     ) = 1

)

select * from final