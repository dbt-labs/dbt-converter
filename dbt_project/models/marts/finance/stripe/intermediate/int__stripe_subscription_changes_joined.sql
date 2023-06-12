with

subscription_changes as (

    select * from {{ ref('int__stripe_subscription_changes_corrections') }}

),

invoices as (

    select * from {{ ref('fct_stripe_invoices') }}

),

subscriptions as (

    select * from {{ ref('dim_stripe_subscriptions') }}

),

stripe_customers as (

    select * from {{ ref('dim_stripe_customers') }}

),

joined as (

    select 
        subscription_changes.*,
        stripe_customers.salesforce_account_id,
        stripe_customers.cloud_account_id,
        stripe_customers.stripe_customer_name,
        stripe_customers.customer_id,
        stripe_customers.customer_name,
        stripe_customers.customer_id_type,
        stripe_customers.billing_account_id,

        subscriptions.is_paid_subscription,
        coalesce(
            post_2019_22_feb.subscription_created_date,
            pre_2019_22_feb.subscription_created_date
        ) as subscription_created_date,
        coalesce(
            post_2019_22_feb.subscription_canceled_date,
            pre_2019_22_feb.subscription_canceled_date
        ) as subscription_canceled_date,

        coalesce(
            post_2019_22_feb.invoice_description,
            pre_2019_22_feb.invoice_description
        ) as invoice_description,
        coalesce(
            post_2019_22_feb.cc_failure_message,
            pre_2019_22_feb.cc_failure_message
        ) as cc_failure_message,
        coalesce(
            post_2019_22_feb.is_paid_invoice,
            pre_2019_22_feb.is_paid_invoice
        ) as is_paid_invoice,
        coalesce(
            post_2019_22_feb.is_charged_invoice,
            pre_2019_22_feb.is_charged_invoice
        ) as is_charged_invoice,
        coalesce(
            post_2019_22_feb.is_subscription_upgrade,
            pre_2019_22_feb.is_subscription_upgrade
        ) as is_subscription_upgrade,
        coalesce(
            post_2019_22_feb.is_full_refund,
            pre_2019_22_feb.is_full_refund
        ) as is_full_refund,

        coalesce(
            post_2019_22_feb.usage_start_date,
            pre_2019_22_feb.usage_start_date
        ) as usage_start_date,

        coalesce(
            post_2019_22_feb.usage_end_date,
            pre_2019_22_feb.usage_end_date
        ) as usage_end_date

    from subscription_changes
    left join stripe_customers using (stripe_customer_id)
    left join subscriptions using (subscription_id)
    left join invoices as post_2019_22_feb
        on subscription_changes.invoice_id = post_2019_22_feb.invoice_id
    left join invoices as pre_2019_22_feb
        on subscription_changes.created_at::date = pre_2019_22_feb.invoice_date::date
        and subscription_changes.subscription_id = pre_2019_22_feb.subscription_id
        and subscription_changes.created_at <= '2019-02-22 08:47:10.000 +0000'
        --prior to 22 Feb 2019, we weren't attributing the `invoice_id` to the subscription event.
        --resolves the issue.

)

select * from joined