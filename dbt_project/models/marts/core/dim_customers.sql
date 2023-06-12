with

transactions as (

    select * from {{ref('fct_cloud_subscription_transactions')}}

),

sfdc_accts as (

    select * from {{ref('dim_salesforce_accounts')}}

),

stripe_accts as (

    select * from {{ref('stg_cloud_stripe__customers')}}

),

customers as (

    select distinct
        customer_id,
        customer_id_type,
        customer_name,
        salesforce_account_id as ref_salesforce_account_id,

----Why are we doing last value here?
    --this is to compensate for migranted accounts,
    --specifically ST to MT or Cloud USA to Cloud EMEA
        last_value(stripe_customer_id) over (
            partition by customer_id
            order by date_day
        ) as ref_stripe_customer_id, 

        last_value(cloud_account_id) over (
            partition by customer_id
            order by date_day
        ) as cloud_account_id,

        last_value(sales_motion) ignore nulls over (
          partition by customer_id
          order by date_day, contract_end_date
        ) as sales_motion,

        sum(revenue_run_rate) over (
          partition by customer_id
          order by date_day
          rows between unbounded preceding and unbounded following
        ) as ltv,

        last_value(case when arr > 0 then arr end) ignore nulls over (
          partition by customer_id
          order by date_day
        ) as latest_arr,

        min(usage_start_date) over (
          partition by customer_id
        ) as customer_start,

        max(usage_end_date) over (
          partition by customer_id
        ) as customer_end

    from transactions

),

enriched as (

    select
        customers.*,
        case
            when customers.customer_end >= current_date
                then true
            else false
        end as is_current,

        coalesce(
            sfdc_accts.billing_region_category,
            stripe_accts.address_region_category
        ) as geo_region,

        coalesce(
            sfdc_accts.billing_country,
            stripe_accts.address_country_name
        ) as geo_country,

        coalesce(
            sfdc_accts.billing_state,
            stripe_accts.address_state
        ) as geo_state,

        sfdc_accts.account_region,
        sfdc_accts.account_subregion,
        sfdc_accts.market_segment,

--For Managed Accounts
        case
            when sales_motion = 'Self-Service'
                then 'Multi Tenant'
              else sfdc_accts.deployment_type
        end as deployment_type,

        sfdc_accts.account_health,
        sfdc_accts.owner_name,
        sfdc_accts.technical_lead,
        sfdc_accts.days_to_renewal

    from customers
    left join sfdc_accts
      on customers.ref_salesforce_account_id = sfdc_accts.account_id
    left join stripe_accts
      on customers.ref_stripe_customer_id = stripe_accts.stripe_customer_id

)

select * from enriched
