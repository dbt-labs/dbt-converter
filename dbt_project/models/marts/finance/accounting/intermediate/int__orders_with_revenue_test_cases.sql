with 

orders as (

    select * from {{ ref('fct_salesforce_orders') }}

),

test_lives_unioned as (

    select
        sfdc_order_id,
        {{ dbt_utils.star(
            from=ref('fct_salesforce_orders'), 
            except=[ "sfdc_order_id"]
        ) }},
        false as is_override

    from orders

    union all

    -- The revenue accounting team developed intentional overrides to confirm the logic is working.
    -- We will remove this once validation by that stakeholder group is complete. 
    -- Source: https://docs.google.com/spreadsheets/d/1WDh3elcUw7QDiV3zciZe0XDBi0UO-pFjGNMHplrYaHM/edit#gid=0
    select
        concat(orders.sfdc_order_id,'_override') as sfdc_order_id,
        {{ dbt_utils.star(
            from=ref('fct_salesforce_orders'), 
            except=["sfdc_order_id"]
        ) }},
        true as is_override
    
    from orders
    where sfdc_order_id in (
        '8014v000005dXShAAM',
        '8014v000005dWZxAAM'
    )

)

select * from test_lives_unioned