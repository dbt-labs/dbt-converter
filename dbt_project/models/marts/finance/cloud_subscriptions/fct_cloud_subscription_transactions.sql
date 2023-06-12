with

sub_changes as (

    select * from {{ref('int__cloud_subscriptions_changes')}}

),

churn_details as (

    select * from {{ ref('int__cloud_subscriptions_churn_details') }}

),

join_churn_details as (

    select
        sub_changes.*,
        churn_details.churn_details

    from sub_changes
    left join churn_details using (id)

),

windowed as (

    select
        *,
        min(date_day) over (partition by customer_id) as customer_first_day,

        datediff(
            day,
            customer_first_day,
            date_day
        ) as customer_day,

        first_value(arr) over (
            partition by customer_id 
            order by date_day 
        ) as customer_starting_arr

    from join_churn_details

),

cleaned_up as (

    select
        id,
        date_day,
        fiscal_year,
        fiscal_quarter_num,
        is_first_day_of_month,
        is_last_day_of_month,
        is_first_day_of_fiscal_quarter,
        is_last_day_of_fiscal_quarter,

        customer_id,
        customer_id_type,
        salesforce_account_id,
        stripe_customer_id,
        cloud_account_id,
        customer_name,

        sales_motion,
        case 
            when sales_motion = 'Self-Service'
                then 'Self-Serve'
            else sales_motion
        end as sales_channel,

        is_customer_active,
        is_customer_first_day,
        customer_day,
        customer_starting_arr,

        arr,
        arr_prior,
        arr_change,

        least(arr, arr_prior) as arr_renewal,

        revenue_run_rate,
        usage_start_date,
        usage_end_date,
        contract_start_date,
        contract_end_date,
        
        change_category,
        coalesce(
            change_category = 'S2M',
            false
        ) as is_enterprise_upgrade,

        has_cc_payment_failure,
        churn_type,
        churn_details

    from windowed

)

select * from cleaned_up
where date_day < current_date()