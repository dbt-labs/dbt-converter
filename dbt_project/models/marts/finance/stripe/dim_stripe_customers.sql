with

stripe_customers as (

    select * from {{ ref('stg_cloud_stripe__customers') }}

),

cloud_account_mappings as (

    select * from {{ ref('cloud_account_mappings') }}

),

final as(

    select
        stripe_customers.stripe_customer_id,

        -- had to add coalesce for a stripe customer not in the mapping
        -- ideally we would surface this to get it fed back into the mapping
        coalesce(
            cloud_account_mappings.customer_id,
            stripe_customers.stripe_customer_id
        ) as customer_id,
        coalesce(
            cloud_account_mappings.customer_name,
            stripe_customers.stripe_customer_name
        ) as customer_name,
        coalesce(
            cloud_account_mappings.customer_id_type,
            'stripe_customer_id - missing from cloud_account_mappings'
        ) as customer_id_type,

        -- Not coalescing to recreate billing account id
        -- Would rather have this fixed via ops reconciliation
        cloud_account_mappings.billing_account_id,

        cloud_account_mappings.account_id as cloud_account_id,
        cloud_account_mappings.salesforce_account_id,

        {{ dbt_utils.star(from=ref('stg_cloud_stripe__customers'), except=['stripe_customer_id']) }}

    from stripe_customers
    left join cloud_account_mappings
        on stripe_customers.stripe_customer_id = cloud_account_mappings.stripe_customer_id
)

select * from final