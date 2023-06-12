{% set fields = ['company_name','display_name','active','balance'] %}

with

quickbook_customers as (

    select * from {{ref('quickbooks_customers_unioned')}}

),

final as (

    select distinct 

        quickbooks_customer_id,

    {% for field in fields %}
        first_value({{ field }} ignore nulls) over (
            partition by quickbooks_customer_id 
            order by quickbooks_account 
            rows between unbounded preceding and unbounded following
        ) as {{ field }},
    {% endfor %}
        min(created_at) over (partition by quickbooks_customer_id) as created_at,
        min(updated_at) over (partition by quickbooks_customer_id) as updated_at

    from quickbook_customers
)

select * from final
