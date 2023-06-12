with

invoice_items as (

    select * from {{ ref('int__invoice_line_items_unioned') }}

),

sfdc_geo as (

    select * from {{ref('dim_salesforce_accounts')}}

),

stripe_geo as (

    select * from {{ref('stg_cloud_stripe__customers')}}

),

rev_schedules as (

    select * from {{ref('stg_salesforce__rev_schedules')}}
    where is_deleted = false

),

joined as (

    select
        invoice_items.*,

        rev_schedules.sfdc_rev_schedule_id,

        coalesce(
            sfdc_geo.billing_region_category,
            stripe_geo.address_region_category
        ) as geo_region,

        coalesce(
            sfdc_geo.billing_country,
            stripe_geo.address_country_name
        ) as geo_country,

        coalesce(
            sfdc_geo.billing_state,
            stripe_geo.address_state
        ) as geo_state

    from invoice_items
    left join sfdc_geo
      on invoice_items.salesforce_account_id = sfdc_geo.account_id
    left join stripe_geo
      on invoice_items.stripe_customer_id = stripe_geo.stripe_customer_id
    left join rev_schedules
      on invoice_items.sfdc_order_item_id = rev_schedules.sfdc_order_item_id
)

select * from joined