with community_signups as (
    select
        *,
        to_object(try_parse_json(se_action)) as se_action_object

    from {{ ref('stg_snowplow_events') }}

    where app_id = 'community.getdbt.com'
        and se_category = 'slack-signup'
        and se_action != 'click-signup'
        -- there's some bad json in here, so we have to filter these records out
        and CHECK_JSON(se_action) is null
        and is_dev_event = false
),

flattened as (
    select
        event_id,
        collector_tstamp as signed_up_at,


        se_action_object:fname::string as first_name,
        se_action_object:lname::string as last_name,
        se_action_object:email::string as email,
        se_action_object:company::string as company,

        se_action_object:location::string as location,
        se_action_object:optIn::boolean as newsletter_opt_in,
        se_action_object:source::string as source,
        se_action_object:title::string as role_title,
        se_action_object:warehouse::string as warehouse

    from community_signups
)

select * from flattened
