--This model calculates the churn details for active churns (i.e. cancelling, downgrading, etc)

with

subscription_changes as (

    select * from {{ ref('int__cloud_subscriptions_changes') }}

),

cloud_account_activities as (

    select * from {{ ref('fct_cloud_account_activities') }}

),

sub_changes_enriched as (

    select
        *,
        lead(change_category) over (
            partition by customer_id
            order by date_day
        ) as next_change_category,

        lead(date_day) over (
            partition by customer_id
            order by date_day
        ) as next_change_category_date

    from subscription_changes

),

churned_customers as (

    select * from sub_changes_enriched
    where change_category = 'churn'

),

cloud_changes as (

    select
        churned_customers.id,
        churned_customers.customer_id,
        cloud_account_activities.account_id as cloud_account_id,
        cloud_account_activities.date_day,

        cloud_account_activities.name as cloud_account_name,
        cloud_account_activities.plan,
        cloud_account_activities.is_locked,
        cloud_account_activities.developer_seats,

        churned_customers.date_day as churn_date,
        churned_customers.churn_type,
        churned_customers.next_change_category,
        churned_customers.next_change_category_date

    from cloud_account_activities
    inner join churned_customers
        on cloud_account_activities.account_id = churned_customers.cloud_account_id
        and cloud_account_activities.date_day >= churned_customers.date_day
        and cloud_account_activities.date_day <= dateadd(day, 8, churned_customers.date_day)

),

filtered as (

    select * from cloud_changes
    qualify row_number() over (
        partition by cloud_account_id
        order by date_day desc) = 1

),

churn_details as (

    select
        id,
        customer_id,
        churn_date,
        churn_type,

        case
            when churn_type = 'active'
                and plan ilike 'developer%'
                then 'downgrade to developer'

            when churn_type = 'active'
                and (plan ilike 'free%'
                or cloud_account_name ilike '%(partner)%')
                --some partner accounts are on enterprise
                    then 'converted to partner account'

            when churn_type = 'passive'
                and next_change_category_date is null
                    then 'cc payment failure'

            when churn_type = 'passive'
                and next_change_category = 'reactivation'
                    then 'cc payment failure ' ||
                         '(reactivated - '||
                         datediff(day,churn_date,next_change_category_date) ||
                         ' days later)'

            else 'cancellation'

        end as churn_details

    from filtered

)

select * from churn_details