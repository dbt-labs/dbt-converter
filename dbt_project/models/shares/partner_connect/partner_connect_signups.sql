{{
    config(
        secure = true,
        schema = "shared_partner_connect",
        post_hook = "{{ share_view(share_name='partner_connect') }}"
    )
}}


with

partner_connect_signups as (

    select * from {{ ref('stg_cloud__partner_connect_signups') }}
    where activated_at is not null 
    and sign_up_source = 'snowflake'

),

customers as (
    
    select * from {{ ref('dim_customers') }}
    
),

payments as (

    select * from {{ ref('fct_transactions') }}

),

payments_agg as (

    select
        customer_id,
        min(invoice_date) as first_paid_at
    from payments
    group by 1

),

joined as (
    
    select 
    
        {{ dbt_utils.generate_surrogate_key([ 
            'partner_connect_signup_id',
            'dbt_cloud_account_id']
        ) }} as partner_connect_id,
            
        partner_connect_signups.created_at,
        partner_connect_signups.activated_at,
        payments_agg.first_paid_at
        
        
    from partner_connect_signups
    left join customers 
        on partner_connect_signups.dbt_cloud_account_id = customers.cloud_account_id
    left join payments_agg
        on customers.customer_id = payments_agg.customer_id
        
)

select * from joined 