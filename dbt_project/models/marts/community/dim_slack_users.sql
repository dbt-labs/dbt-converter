-- indicators are percentiles of a respective metric in q3 2020 at Nov 2020,
--     with all nulls and 0's excluded

{% set help_slack_channels = "('beginners', 'support')" %}
{% set message_count_p50 = 6 %}
{% set message_count_p75 = 19 %}
{% set total_help_channel_replies_p75 = 14 %}
{% set total_other_channel_replies_p75 = 15 %}
{% set reply_length_p75 = 186 %}
{% set large_reply_count_p75 = 7 %}
{% set user_reaction_count_p75 = 11 %}

with users as (

    select * from {{ ref('stg_slack__users') }}

),

reactions as (

    select * from {{ ref('stg_slack__reactions') }}

),

channel_joins as (

    select * from {{ ref('fct_slack_channel_joins') }}

),

access_logs as (

    select * from {{ ref('stg_slack__access_logs') }}

),

messages as (

    select * from {{ ref('fct_slack_messages') }}

),

partners as (

    select * from {{ ref('stg_salesforce__partners') }}

),

user_reaction_counts as (

    select
        user_id,
        min(message_sent_at) as first_reaction_at, 
        count(*) as total_reaction_count

    from reactions

    group by 1

),

user_channel_joins as (

    select
        user_id,
        min(joined_at) as first_channel_joined_at

    from channel_joins

    group by 1

),

user_access_logs as (

    select
        user_id,
        min(start_at) as first_accessed_at,
        max(start_at) as last_accessed_at

    from access_logs

    group by 1

),

user_messages as (

    select
        user_id,
        min(sent_at) as first_message_at,
        max(sent_at) as most_recent_message_at,
        count(*) as number_of_messages,
        count(case when is_post then message_id end) as number_of_posts,
        count(case when is_reply then message_id end) as number_of_replies,

        count(
            case
                when is_reply
                and channel_name in {{ help_slack_channels }}
                    then message_id
            end
        ) as number_of_replies_in_help_channels,

        count(
            case
                when is_reply
                and channel_name not in {{ help_slack_channels }}
                    then message_id
             end
        ) as number_of_replies_in_other_channels,

        count(
            case
                when is_reply
                and text_length > {{ reply_length_p75 }}
                    then message_id
            end
        ) as large_form_replies

    from messages

    group by 1

),

partners_info as (
  --The partners model can have a partner listed more than once depending on
  --the partnership type (e.g. <Company> - Consulting and <Company> - Training)
  --This looks at the oveall company name and the associated domain
    select distinct
        account_name,
        primary_domain

    from partners

),

 -- count(case when is_reply and messages.channel_id not (...) then message_id end) as number_of_microcom_replies,
-- messages in a set of specific channels and which that is (use a json)
-- reactions

final as (

    select
        users.user_id,
        users.name,
        users.email,
        users.pronouns,
        users.timezone,
        users.region_category,
        users.country_name,
        users.country_code,
        users.has_joined_workspace,

        coalesce(
          partners_info.account_name, --we want to ensure that the Partner name is consistent, especially as we use this to filter their Sale
          users.company_info
        ) as company_info,

        case
            when partners_info.account_name is not null
                then true
            else false
        end as is_partner,

        -- first_accessed is rarely later than channel joined at, and almost never empty so let's use by default for consistency
        coalesce(
            user_access_logs.first_accessed_at,
            user_channel_joins.first_channel_joined_at,
            users.updated_at
         ) as joined_at,

        row_number() over (
            order by joined_at
        ) as nth_user,

        -- include all explicitly to see which is being used
        user_access_logs.first_accessed_at, 
        user_channel_joins.first_channel_joined_at, 
        users.updated_at as user_record_last_updated,
    
        user_messages.first_message_at,
        user_messages.most_recent_message_at,

        -- add first reaction date (not exact, based on first message date but useful to track)
        user_reaction_counts.first_reaction_at,

        user_access_logs.last_accessed_at,

        coalesce(
            user_messages.most_recent_message_at > DATEADD(month, -3, current_timestamp),
            false
        ) as is_active_past_quarter,

        coalesce(user_messages.number_of_messages, 0) as number_of_messages,
        coalesce(user_messages.number_of_posts, 0) as number_of_posts,
        coalesce(user_messages.number_of_replies, 0) as number_of_replies,

        1.0 * user_messages.number_of_replies / nullif(user_messages.number_of_messages, 0)
            as reply_to_messages_ratio,

        user_messages.first_message_at is not null as has_messaged,

        coalesce(
            user_messages.number_of_messages > {{ message_count_p50 }},
            false
        ) as has_posted_avg_amount,

        coalesce(
            user_messages.number_of_messages > {{ message_count_p75 }},
            false
        ) as has_posted_high_amount,

        coalesce(
            user_messages.number_of_replies_in_help_channels > {{ total_help_channel_replies_p75 }},
            false
        ) as has_made_many_help_replies,

        coalesce(
            user_messages.number_of_replies_in_help_channels > {{ total_other_channel_replies_p75 }},
            false
        ) as has_made_many_non_help_channel_replies,

        coalesce(
            user_messages.large_form_replies > {{ large_reply_count_p75 }},
            false
        ) as has_posted_many_large_replies,

        coalesce(
            user_reaction_counts.total_reaction_count > {{ user_reaction_count_p75 }},
            false
        ) as has_received_many_reactions

    from users

    left join user_channel_joins
        on users.user_id = user_channel_joins.user_id

    left join user_access_logs
        on users.user_id = user_access_logs.user_id

    left join user_messages
        on users.user_id = user_messages.user_id

    left join user_reaction_counts
        on users.user_id = user_reaction_counts.user_id

    left join partners_info
        on split_part(users.email, '@', -1) = partners_info.primary_domain

)

select * from final
