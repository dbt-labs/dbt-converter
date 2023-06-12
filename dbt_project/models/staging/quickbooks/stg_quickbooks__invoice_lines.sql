with

lines as (

    select * from {{ref('base__quickbooks_invoice_lines')}}

),

quickbooks_customer_id_map as (

    select * from {{ref('stg_quickbooks__customer_id_map')}}

),

customers as (

    select * from {{ref('stg_quickbooks__customers')}}

),

joined as (

    select 

        {{ dbt_utils.star(
            from=ref('base__quickbooks_invoice_lines'),
            except=["QUICKBOOKS_CUSTOMER_ID"]
        ) }},

        -- this customer stitching functionality handles cross-account
        -- identification for customers. more info can be found in the
        -- documentation for stg_customer_id_map.
        coalesce(
            quickbooks_customer_id_map.customer_id_map_to::varchar,
            quickbooks_customer_id::varchar
        ) as quickbooks_customer_id,

        quickbooks_customer_id as original_quickbooks_customer_id

    from lines
    left join quickbooks_customer_id_map
        on lines.quickbooks_customer_id::varchar =
            quickbooks_customer_id_map.customer_id_map_from::varchar

),

customers_info as (

    select
        joined.*,
        customers.salesforce_account_id,
        customers.stripe_customer_id,
        customers.display_name as quickbooks_customer_name

    from joined
    left join customers
        on joined.quickbooks_customer_id = customers.quickbooks_customer_id
    --When a customer updates from Self-Service to Enterprise
    --the customers table updates to using the correct customer_id
    --(e.g. keeping the stripe_customer_id), but the invoice_lines 
    --table only uses the quickbooks_customer_id. This is why we
    --have to do the join in the next CTE

),

enriched as (

    select
        *,
        case
            when item_id in (31, 6)
                then 'enterprise'
            when item_id in (25, 15)
                and description ilike '%snowplow%'
                then 'snowplow'
            when item_id = 25
                and description ilike '%cloud%subscription%'
                then 'self-service'
        end as transaction_type

    from customers_info

)

select * from enriched