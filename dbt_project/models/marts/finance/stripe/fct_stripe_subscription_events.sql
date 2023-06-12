with

subscription_changes as (

    select * from {{ ref('int__stripe_subscription_changes_joined') }}
    where is_subscription_change_event
),

calculations as (

    select
        *,

        case
            when not is_paid_invoice
                and cc_failure_message is null
                then 0
            when is_full_refund then 0
            when cost_change = 0
                then cost
            when subscription_change_type = 'pricing change'
                then cost
            else cost_change
        end as total_charged_amount

    from subscription_changes

),

organized as (

    select
        unique_id,
        event_id,
        stripe_customer_id,
        stripe_customer_name,
        customer_id,
        customer_name,
        customer_id_type,
        cloud_account_id,
        billing_account_id,
        salesforce_account_id,

        subscription_id,
        invoice_id,
        previous_invoice_id,
        plan_id,
        plan_name,

        subscription_created_date,
        subscription_canceled_date,

        event_type,
        invoice_description,
        cc_failure_message,
        is_paid_subscription,
        is_paid_invoice,
        is_charged_invoice,
        is_subscription_upgrade,
        is_full_refund,

        charge_status,
        cost_change_comment,

        quantity,
        price,
        previous_quantity,
        quantity_change,
        cost,
        previous_cost,
        cost_change,
        total_charged_amount,
        subscription_change_type,
        created_at,
        updated_at,
        current_period_start,
        current_period_end,
        usage_start_date,
        usage_end_date,
        canceled_at

    from calculations

)

select * from organized
