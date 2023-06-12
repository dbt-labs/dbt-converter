with

-- clarifying identifying fields with salesforce prefix due to later select *
salesforce_accounts as (

    select 
        account_id as salesforce_account_id,
        account_name as salesforce_account_name,
        parent_id as parent_salesforce_account_id,
        {{ dbt_utils.star(
            from=ref('dim_salesforce_accounts'),
            except=['account_id','account_name','parent_id']
        ) }}

    from {{ ref('dim_salesforce_accounts') }}

),

customers_without_salesforce_accounts as (

    select * from {{ ref('dim_customers') }}
    where ref_salesforce_account_id is null

),

-- identifying organizations primarily from salesforce with any gaps filled by customer info
final as (

    select 
        coalesce(
            salesforce_accounts.salesforce_account_id,
            customers_without_salesforce_accounts.ref_stripe_customer_id
        ) as organization_id,
        coalesce(
            salesforce_accounts.salesforce_account_name,
            customers_without_salesforce_accounts.customer_name
        ) as organization_name,
        case 
            when salesforce_accounts.salesforce_account_id is not null
                then 'salesforce_account'
            when customers_without_salesforce_accounts.ref_stripe_customer_id is not null
                then 'stripe_customer'
        end as organization_record_type,
        -- there would be no concept of a parent of a stripe-sourced org
        parent_salesforce_account_id as parent_organization_id,
        salesforce_accounts.* 
        
    from salesforce_accounts 
    full join customers_without_salesforce_accounts
        on salesforce_accounts.salesforce_account_id = customers_without_salesforce_accounts.ref_salesforce_account_id

)

select * from final