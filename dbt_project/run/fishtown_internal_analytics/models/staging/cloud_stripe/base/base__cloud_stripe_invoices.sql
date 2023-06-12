
  create or replace   view analytics_dev.dbt_jstein.base__cloud_stripe_invoices
  
   as (
    with

source as (

    select * from raw.dbt_cloud_stripe.invoices

),

renamed as (

    select

        id as invoice_id,
        number as invoice_number,
        customer as stripe_customer_id,
        subscription as subscription_id,
        charge as charge_id,
        payment as payment_id,
        receipt_number,

        currency,
        description as invoice_description,
        status as invoice_status,
        attempt_count,

        case
            when description = 'Subscription Tax Adjustment'
               then true
            else false
        end as is_sales_tax_adjustment,

        case
            when description = 'Subscription upgrade'
            or (subscription_id is null and not is_sales_tax_adjustment)
                --(e.g.'in_1IeJb2KS6Y3lIrasBGGqF8gB')
                then true
            else false
        end as is_subscription_upgrade,

        paid as is_paid_invoice,
        closed as is_closed_invoice,

        total::float/100 as amount_invoiced,
        starting_balance::float/100 as starting_balance,
        amount_due::float/100 as amount_due,
        amount_paid::float/100 as amount_paid,

    --The `total` column is original charged amount for the invoice,
        --but  `amount_total - starting_balance` is the amount
        --that was _actually_ charged to them after readjusting credits
        --e.g. ('in_1KK1KvKS6Y3lIrasAaDVd054', 'in_1IAFZcKS6Y3lIraskq0nXK7B')
    --However, subscription upgrades are automatically charged
    --and do not have an `amount_due` (e.g. 'in_1JzJMkKS6Y3lIrasTfEEha5i'
        case
            when is_subscription_upgrade
                then amount_invoiced
    --And for Sales Tax Adjustments, they are only being charged for the 
    --sales tax and NOT the invoiced total (e.g. 'in_1I70KmKS6Y3lIrasRhjC0zuX')
            when is_sales_tax_adjustment
                then amount_due::float/100
            else amount_due::float/100 - starting_balance::float/100
        end as invoice_total,

        date as invoice_date,
        period_start as invoice_period_start,

        -- invoices with missing plans default to period_end = period_start
        case
            when period_end = period_start
                then dateadd('month',1,period_start)
            else period_end
        end as invoice_period_end,

        datediff(
            month,
            invoice_period_start,
            invoice_period_end
        ) as usage_period_in_m

    from source

)

select * from renamed
  );

