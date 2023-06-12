with

transactions as (

    select * from {{ref('int__cloud_subscriptions_daily')}}
    where is_customer_last_day
    --churned self-service will already have their last
    --unpaid invoice as their churn date.

),

all_days as (

    select * from {{ ref('all_days') }}

),

with_next_date as (

    select
        {{ dbt_utils.star(
            from=ref('int__cloud_subscriptions_daily'),
            except=["DATE_DAY"])
        }},
        dateadd(day, 1, date_day) as date_day

    from transactions

),

churn_records as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'with_next_date.date_day',
            'customer_id',
            'sales_motion'
        ]) }} as id,

    --to ensure we're using the correct date mappings
    --in case someone cancels and then reactivates multiple days later
        with_next_date.date_day,
        all_days.fiscal_year,
        all_days.fiscal_quarter_num,
        all_days.is_first_day_of_month,

        case
            when with_next_date.date_day = dateadd(day, -1, current_date())
                then true
            else all_days.is_last_day_of_month
        end as is_last_day_of_month,

        all_days.is_first_day_of_fiscal_quarter,

        case
            when with_next_date.date_day = dateadd(day, -1, current_date())
                then true
            else all_days.is_last_day_of_fiscal_quarter
        end as is_last_day_of_fiscal_quarter,

        customer_id,
        customer_id_type,
        billing_account_id,

        cloud_account_id,
        salesforce_account_id,
        stripe_customer_id,

        customer_name,
        sales_motion,

        false::boolean as is_plan_upgrade,
        has_cc_payment_failure,
        contract_start_date,
        contract_end_date,
        usage_start_date,
        usage_end_date,

        0::float as arr,
        0::float as revenue_run_rate,
        false::boolean as is_customer_active,
        false::boolean as is_customer_first_day,
        false::boolean as is_customer_last_day

    from with_next_date
    left join all_days
        on with_next_date.date_day = all_days.date_day

)

select * from churn_records