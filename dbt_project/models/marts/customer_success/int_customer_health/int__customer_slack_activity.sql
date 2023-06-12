with slack_users as (

    select * from {{ ref('dim_slack_users') }}
    where email is not null
),

--this cte filters users to a single account based on the primary flag and the latest update timestamp
unique_cloud_user_mapping as (

    select * 
    from {{ ref('fct_cloud_user_account_mappings') }}
    where not is_fishtown_user
        and not is_account_deleted
        and not is_user_license_deleted
        and not is_partner_training_acct
        and is_current_paying_account
    qualify row_number() over(
        partition by email
        order by user_account_association_last_updated_at desc) = 1
),

map_slack_user_to_account as (

    select

        unique_cloud_user_mapping.account_id as cloud_account_id,
        unique_cloud_user_mapping.customer_id,
        unique_cloud_user_mapping.salesforce_account_id,
        unique_cloud_user_mapping.stripe_customer_id,
        slack_users.user_id,
        slack_users.email,
        slack_users.joined_at,
        slack_users.first_accessed_at,
        slack_users.first_message_at,
        slack_users.most_recent_message_at,
        slack_users.first_reaction_at,
        slack_users.last_accessed_at,
        slack_users.is_active_past_quarter

    from unique_cloud_user_mapping
    inner join slack_users using (email)
),

account_slack_summary as (

    select

        customer_id,
        salesforce_account_id,

        count(distinct email) as slack_user_count,

        count(distinct
            case
                when is_active_past_quarter
                    then email
            end) as slack_user_active_past_quarter_count,

        max(most_recent_message_at) as last_slack_message_at

    from map_slack_user_to_account
    group by 1,2

)

select * from account_slack_summary