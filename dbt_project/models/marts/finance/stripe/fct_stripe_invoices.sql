with

invoices as (

    select * from {{ ref('stg_cloud_stripe__invoices') }}

),

line_items as (

    select * from {{ ref('stg_cloud_stripe__invoice_line_items') }}

),

stripe_customers as (

    select * from {{ ref('dim_stripe_customers') }}

),

subscriptions as (

    select * from {{ ref('dim_stripe_subscriptions') }}

),

line_items_agg as (

    select
        invoice_id,
        sum(case
                when line_item_subtype in ('subscription upgrade','proration')
                    then item_amount
                else 0
        end) as invoice_item_revenue,

        sum(case
                when line_item_subtype = 'sales tax'
                    then item_amount
                else 0
        end) as invoice_sales_tax

    from line_items
    group by 1

),

joined as (

    select
        invoices.*,
        stripe_customers.salesforce_account_id,
        stripe_customers.cloud_account_id,
            --no stripe_customer_id is okay because
            --stripe_customer_id is in invoices and 
            --we're getting an explicit select below
        stripe_customers.stripe_customer_name,
        stripe_customers.customer_id,
        stripe_customers.customer_name,
        stripe_customers.customer_id_type,
        stripe_customers.billing_account_id,

        coalesce(subscriptions.stripe_plan_id, 'paid') as plan_id,
        coalesce(subscriptions.stripe_plan_name, 'Paid') as plan_name,
            --this is historical logic we've used because the only
            --occasion a stripe_plan_id is populated is when it is
            --"free" or NULL. We want to populate these fields 
            --so we can filter out free subscriptions in the transactions
            --model

        subscriptions.subscription_created_at::date as subscription_created_date,
        subscriptions.subscription_canceled_at::date as subscription_canceled_date,

        case
            when is_subscription_upgrade then true
            --subscription upgrades/prorations do not have a
            --subscription_id associated but these are automatically
            --charged.
            else subscriptions.is_paid_subscription
        end as is_paid_subscription,

        coalesce(line_items_agg.invoice_item_revenue,0) as invoice_item_revenue,
        coalesce(line_items_agg.invoice_sales_tax,0) as invoice_sales_tax,
        coalesce(
            1 - (invoice_total-invoice_sales_tax)/nullif(invoice_total,0),
            0
        )::float as sales_tax_rate,
        stripe_customers.address_city as billing_city,
        stripe_customers.address_state as billing_state,
        stripe_customers.address_zip as billing_postal_code,
        stripe_customers.address_country_name as billing_country,
        stripe_customers.address_country as billing_country_code,
        stripe_customers.address_region_category as billing_region

    from invoices
    left join line_items_agg using (invoice_id)
    left join stripe_customers using (stripe_customer_id)
    left join subscriptions using (subscription_id)

),

calc_revenue as (

    select
        *,
        refund_total * sales_tax_rate as refund_sales_tax,

        case
            when refund_total = invoice_sales_tax
                then 0 --we don't count sales_tax towards the
                       --invoice_subtotal so we're emitting
                       --tax refunds here.
            else refund_total - refund_sales_tax
        end as refund_subtotal,

        case
            when is_full_refund
                or invoice_total = 0
                    then 0
            else invoice_total
                - invoice_sales_tax
                - refund_subtotal
        end as invoice_subtotal,

        case
            when is_full_refund
                then 0
            else invoice_item_revenue
        end as subscription_prorations,

        case
            when not is_subscription_upgrade
                and not is_full_refund
                then (invoice_subtotal - subscription_prorations)::int
            else 0
        end as subscription_revenue


    from joined

),

calc_usage_periods as (

    select
        *,

        datediff(
            month,
            invoice_period_start,
            invoice_period_end
        ) as usage_period_in_months,

        datediff(
                month,
                subscription_created_date,
                invoice_date
        ) as months_since_contract_start,

    --we want to ensure that the usage period starts/ends
    --on the same date as their subscription start date
    --This doesn't happen often but this is to catch the edge
    --cases where the invoice occurs on the same day but close
    --to midnight so it rounds up when you date_trunc
    --(e.g. cus_BRYO3gvyslIJvT, cus_BsOT8NGFHxNDYF, cus_DxftyywTem8tXa)
    --We also use this instead of invoice_period_start/end bc
    --those reflect the _invoice payment period_, not the usage period
    dateadd(
            month,
            months_since_contract_start,
            subscription_created_date::date
    ) as usage_start_date,

    case
    --CC failures are based off of the latest charge_id
    --so the cc failure message will disappear if the
    --most recent charge goes through. otherwise the sub will cancel
    --8 days after the usage start date.
    --This is so all churned accounts do not change historically
    --if someone is currently in a payment failure + then they resolve it
    --within a given 8 day grace period.
        when cc_failure_message is not null
            then coalesce(
                    subscription_canceled_date,
                    dateadd(
                        day,
                        8,
                        usage_start_date
                    )
                )
        else dateadd(
                month,
                months_since_contract_start + usage_period_in_months,
                subscription_created_date
            )
        --this is to ensure that we're using the correct date based off of the
        --subscription creation date. We have to do it this way to avoid early
        --usage end dates (e.g. 2/28 -> 3/28 when the subscription started on 1/29
        --where stripe_customer_id = 'cus_AhfbPjHLRnxlbg')
    end as usage_end_date

    from calc_revenue

),

invoices_organized as (

    select
        invoice_id,
        stripe_customer_id,
        customer_id,
        customer_id_type,
        cloud_account_id,
        billing_account_id,
        subscription_id,
        charge_id,
        salesforce_account_id,

        customer_name,
        stripe_customer_name,
        plan_id,
        plan_name,

        subscription_created_date,
        subscription_canceled_date,


        invoice_number,
        invoice_description,
        invoice_status,
        is_closed_invoice,
        is_charged_invoice,
        is_subscription_upgrade,
        is_paid_subscription,
        is_paid_invoice,
        is_full_refund,

        sales_tax_rate,
        invoice_total,
        invoice_sales_tax,
        refund_total,
        refund_sales_tax,
        refund_subtotal,
        invoice_subtotal,

        subscription_revenue,
        subscription_prorations,

        currency,
        cc_failure_message,
        cc_expiration_date,
        invoice_date,
        invoice_period_start,
        invoice_period_end,

        usage_period_in_months,
        usage_start_date,
        usage_end_date,

        billing_city,
        billing_state,
        billing_postal_code,
        billing_country,
        billing_country_code,
        billing_region

    from calc_usage_periods

)

select * from invoices_organized