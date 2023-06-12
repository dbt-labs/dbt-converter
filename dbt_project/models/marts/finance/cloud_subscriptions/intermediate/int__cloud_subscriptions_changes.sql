
{% set window_clause = 'partition by customer_id order by date_day,usage_start_date' %}
    --by ric [12 Jan 2023]
        --we order by usage_start to account for when a customer's subscriptions overlap
        --we define ARR by when the contract was booked and in 2021-2023, sometimes the close date
        --for a managed account will overlap if they already paid for their subscriptions
        --This will be resolved starting mid-2023 (FY24)
        --see Slack Thread:
            -- https://dbt-labs.slack.com/archives/C03SX8FU2MD/p1673553543794779?thread_ts=1670358668.292529&cid=C03SX8FU2MD

with

transactions as (

    select * from {{ref('int__cloud_subscriptions_daily_unioned')}}

),

transactions_windowed as (

    select
        *,

        lag(arr) over (partition by customer_id, sales_motion order by date_day) as arr_prior_by_sm,

        lag(arr) over ({{ window_clause }}) as arr_prior_by_customer,

        lead(sales_motion) over ({{ window_clause }}) as next_sales_motion,

        lag(is_customer_active) over ({{ window_clause }}) as previous_is_customer_active

    from transactions

),

with_changes as (

    select
        *,
        case
            when is_customer_first_day
                and arr > 0
                then 'new'

            when is_plan_upgrade
                and sales_motion = 'Self-Service'
                then 'S2M'

            when not is_customer_active
                and previous_is_customer_active
                and date_day < current_date()
                    then 'churn'

            when not previous_is_customer_active
                and is_customer_active
                    then 'reactivation'

            when is_plan_upgrade
                and sales_motion = 'Managed'
                    then 'S2M (managed upgrade)'

            when arr > arr_prior_by_sm
                and previous_is_customer_active
                then 'upgrade'

            when  arr < arr_prior_by_sm
                and previous_is_customer_active
                and is_customer_active
                and date_day < current_date()
                then 'downgrade'
        end as change_category,

        case
            when change_category = 'churn'
            and has_cc_payment_failure
                then 'passive'
            when change_category = 'churn'
            and not has_cc_payment_failure
                then 'active'
        end as churn_type

    from transactions_windowed

),

final_arr as (

    select
        {{ dbt_utils.star(
            from=ref('int__cloud_subscriptions_daily_unioned')
        )}},

        change_category,
        case
            when change_category = 'S2M (managed upgrade)'
                then arr_prior_by_customer
            when change_category = 'S2M'
                then arr_prior_by_sm
            else coalesce(arr_prior_by_sm,0)
        end as arr_prior,

        arr - arr_prior as arr_change,

        case
            when change_category = 'churn'
            and has_cc_payment_failure
                then 'passive'
            when change_category = 'churn'
            and not has_cc_payment_failure
                then 'active'
        end as churn_type,

        least(arr, arr_prior) as arr_renewal

    from with_changes

)

select * from final_arr