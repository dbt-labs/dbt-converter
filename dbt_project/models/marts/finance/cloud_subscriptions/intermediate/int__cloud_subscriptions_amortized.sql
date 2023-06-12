with

cloud_transactions as (

    select * from {{ ref('fct_cloud_transactions') }}
    where usage_start_date != usage_end_date
    --this is when seat changes happen on the same day as the contract
    --renewal (both for SS and Managed) as the contract renewal is
    --inclusive of the same-day expansions.
    and transaction_id != 'fbc8fe1ae3629e5d1623e8867b5af46e'
    --we want to exclude this from our calculations bc it's a strange edge case
    --Calix was supposed to be fully refunded and they were paying for their team
    --plan which should've been removed/deprecated.

),

all_days as (

    select * from {{ ref('all_days') }}

),

subs_windowed as (
    /*This section creates util fields to account for S2M upgrades
    The idea here is to pull in dates for when a customer upgrades to managed.
    We add the `case when` bc we want to make date changes for seat upgrades and subscription charges
    e.g. customer_id = 'cus_GXyS4dUd4uZKUR'*/
    select
        *,
        rank() over (
            partition by customer_id, billing_contract_id, sales_motion
            order by usage_end_date desc
        ) as billing_contract_grouping,

        lag(usage_end_date) over (
            partition by customer_id
            order by usage_start_date
        ) as prev_usage_end_date,

        lag(sales_motion) over (
            partition by customer_id
            order by usage_start_date
        ) as prev_sales_motion,

        lead(case when sales_motion = 'Managed' then sales_motion end) ignore nulls over (
            partition by customer_id
            order by contract_start_date, usage_start_date
        ) as next_sales_motion,

        lead(case when sales_motion = 'Managed' then usage_start_date end) ignore nulls over (
            partition by customer_id
            order by contract_start_date, usage_start_date
        ) as next_manage_usage_start_date

    from cloud_transactions
    where is_subscription_charge

),

s2m_fixings as (

    select
        {{ dbt_utils.star(
            from=ref('fct_cloud_transactions'),
            except=[
                "TRANSACTION_ID",
                "USAGE_END_DATE"
            ]
        ) }},

        case
            when sales_motion = 'Self-Service'
                and next_sales_motion = 'Managed'
                and billing_contract_grouping = 1
                and datediff(
                    days,
                    usage_end_date,
                    next_manage_usage_start_date
                    ) <= 30
                        then true
            when sales_motion = 'Managed'
                and prev_sales_motion = 'Self-Service'
                and transaction_description = 'Land'
                and datediff(
                    days,
                    prev_usage_end_date,
                    usage_start_date
                    ) <= 30
                        then true
                    --Specifically adding this datediff for customers that
                    --churned and came back as a Managed customer
                    --e.g. 0014v00002IchPDAAZ & usage_start_date >= '2021-02-14'
                    --and we use usage_start_date bc this is when the ARR is booked
                    --while the contract_start_date is when the contract begins.
            else false
        end as is_plan_upgrade,

        case
            when is_plan_upgrade
                and sales_motion = 'Self-Service'
                and usage_end_date < next_manage_usage_start_date
                   then next_manage_usage_start_date
        --this fixes cases when there is a gap between booking periods
        --e.g. stripe_customer_id = 'cus_M7atXFJQklyyzl' and usage_start_date >= '2021-02-12'
        --     stripe_customer_id = 'cus_H9WBDomvCQcgQe' and usage_start_date >= '2022-08-07'
            else usage_end_date
        end as usage_end_date

    from subs_windowed

),

subs_spined as (

    select
        all_days.date_day,
        all_days.fiscal_year,
        all_days.fiscal_quarter_num,
        all_days.is_first_day_of_month,

        case
            when date_day = dateadd(day, -1, current_date())
                then true
            else is_last_day_of_month
        end as is_last_day_of_month,

        is_first_day_of_fiscal_quarter,
        case
            when date_day = dateadd(day, -1, current_date())
                then true
            else is_last_day_of_fiscal_quarter
        end as is_last_day_of_fiscal_quarter,

        s2m_fixings.*

    from s2m_fixings
    left join all_days
        on (s2m_fixings.usage_start_date <= date_day
        and s2m_fixings.usage_end_date > date_day)

),

subs_agg as (

    select
        date_day,
        fiscal_year,
        fiscal_quarter_num,
        is_first_day_of_month,
        is_last_day_of_month,
        is_first_day_of_fiscal_quarter,
        is_last_day_of_fiscal_quarter,
        customer_id,
        customer_id_type,
        billing_account_id,

        cloud_account_id,
        salesforce_account_id,
        stripe_customer_id,

        customer_name,
        sales_motion,

        max(
            case
                when is_plan_upgrade
                and sales_motion = 'Self-Service'
                and date_day = dateadd(day, -1, usage_end_date)
                    then true
                when is_plan_upgrade
                and sales_motion = 'Managed'
                and date_day = usage_start_date
                    then true
                else false
        end) as is_plan_upgrade,
        --we max() this bc sometimes a SS plan can be unpaid (and in grace period)
        --but it's because they are in the middle of switching to their managed plan
        --e.g. where customer_id = '0014v00002NCjlpAAD' and date_day >= '2021-10-01'

        max(transaction_description ilike '%payment failure%') as has_cc_payment_failure,
    -----to absolve subscription upgrade/downgrades
        max(contract_start_date) as contract_start_date,
        max(contract_end_date) as contract_end_date,

        max(usage_start_date) as usage_start_date,
        max(usage_end_date) as usage_end_date,

        sum(arr) as arr

    from subs_spined
    {{ dbt_utils.group_by(15) }}
        --We have to aggregate this for occasions where customers
        --pay for their subscription and upgrade/downgrade on
        --the same day

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'date_day',
            'customer_id',
            'sales_motion'
        ]) }} as id,
        *

    from subs_agg

)


select * from with_id 