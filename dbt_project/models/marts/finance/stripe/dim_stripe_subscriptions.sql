{{
  config(
    materialized = "view"
  )
}}

with

subscriptions as (

    select * from {{ ref('stg_cloud_stripe__subscriptions') }}

),

invoices as (

    select * from {{ ref('stg_cloud_stripe__invoices') }}

),

find_first_paid_invoice as (
/*The goal of this CTE is to understand the actual paid invoices
and unpaid invoices for a given subscription. These fields will help
us understand when Stripe falsely cancels a subscription due to a
CC failure */

    select
        subscription_id,
        min(
            case when is_paid_invoice
                and not is_full_refund
                then invoice_date::date
            end
        ) as first_sub_paid_invoice_date,
        max(
            case when is_paid_invoice
                and not is_full_refund
                then invoice_date::date
            end
        ) as last_sub_paid_invoice_date

    from invoices
    group by 1

),

joined as (
    select
        {{ dbt_utils.star(
            from=ref('stg_cloud_stripe__subscriptions'),
            except=[
                "SUBSCRIPTION_CANCELED_AT"
            ],
            relation_alias='subscriptions'
        ) }},

    --specific edge case where we were incorrectly charging them post-S2M
    --contract for six months
        case
            when stripe_customer_id = 'cus_GnQxdCblJCXnRL'
                then last_sub_paid_invoice_date
            else subscription_canceled_at
        end as subscription_canceled_at,

    --boolean to flag if a customer has ever paid for an invoice on a given
    --subscription. there are some customers that have numerous CC failures
    --when they first sign up which cancels the subscription and then makes a new one
    --(e.g. customer_id = 'cus_KjmpgsxENMc8RE')
        first_sub_paid_invoice_date is not null as is_paid_subscription

    from subscriptions
    left join find_first_paid_invoice
        on subscriptions.subscription_id = find_first_paid_invoice.subscription_id

)

select * from joined