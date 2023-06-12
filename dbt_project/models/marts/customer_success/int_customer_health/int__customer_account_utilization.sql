with

customers as (

    select * from {{ ref('dim_customers') }}

),

cloud_accounts as (

    select * from {{ ref('fct_cloud_accounts') }}
    where is_current_paying_account

),

cloud_users as (

    select * from {{ ref('fct_cloud_user_account_mappings') }}
    where not is_fishtown_user
    and not is_account_deleted
    and not is_partner_training_acct
    and is_current_paying_account

),

managed_seats as (

    select * from {{ ref('fct_account_license_seats') }}
    where current_date = date_day

),

cloud_info as (

    select
        customer_id,
        salesforce_account_id,
        plan,
        plan_tier,
        sum(run_slots) as run_slots
    from cloud_accounts
    group by 1,2,3,4

),

--[4 Aug 2022: Erica] TODO: we should add the customer or org_id here
managed_users_agg as (

    select
        customer_id,

        count(distinct email) as total_assigned_seats,
        --we use email because for ST, one employee can have different user_ids
        count(distinct
            case when license_type = 'developer'
            then email end
        ) as total_assigned_developers,

        count(distinct
            case when license_type = 'read_only'
            then email end
        ) as total_assigned_read_only

    from cloud_users
    where is_user_license_deleted = 0
        and plan ilike 'enterprise%'
    group by 1

),

seats_purchased as (

    select
        salesforce_account_id,
        sum(total_allocated_seats) as total_purchased_seats,
        sum(total_develop_seats) as total_purchased_developer,
        sum(total_read_seats) as total_purchased_read_only

    from managed_seats
    group by 1

),

team as (

    select
        customer_id,
        total_seats,
        developer_seats,
        read_only_seats,
        total_users,
        total_users_developers,
        total_users_read_only
    from cloud_accounts
    where plan_tier = 'team'

),

joined as (

    select
        customers.customer_id,
        cloud_info.plan,
        cloud_info.plan_tier,
        cloud_info.run_slots,

    ----purchased seats
        coalesce(
            seats_purchased.total_purchased_seats,
            team.total_seats
        ) as total_purchased_seats,

        coalesce(
            seats_purchased.total_purchased_developer,
            team.developer_seats
        ) as total_purchased_seats_developer,

        coalesce(
            seats_purchased.total_purchased_read_only,
            team.read_only_seats
        ) as total_purchased_seats_read_only,

    ----assigned seats
        coalesce(
            managed_users_agg.total_assigned_seats,
            team.total_users
        ) as total_assigned_seats,

        coalesce(
            managed_users_agg.total_assigned_developers,
            team.total_users_developers
        ) as total_assigned_developers,

        coalesce(
            managed_users_agg.total_assigned_read_only,
            team.total_users_read_only
        ) as total_assigned_read_only

    from customers
    left join cloud_info
        on customers.customer_id = cloud_info.customer_id
    left join team
        on customers.customer_id = team.customer_id
    left join seats_purchased
        on customers.ref_salesforce_account_id = seats_purchased.salesforce_account_id
    left join managed_users_agg
        on customers.customer_id = managed_users_agg.customer_id
        --this is to ensure that, for managed accounts, we only bring in the seats
        --on the organization-level which is mainly used for single-tenant clients

),

calcs as (

    select
        *,

        round(
            (total_assigned_seats/nullif(total_purchased_seats,0)),
            4
        ) as seat_utilization_pct,

        round(
            (total_assigned_developers/nullif(total_purchased_seats_developer,0)),
            4
        ) as seat_utilization_pct_developer,

        round(
            (total_assigned_read_only/nullif(total_purchased_seats_read_only,0)),
            4
        ) as seat_utilization_pct_read_only

    from joined

)

select * from calcs 