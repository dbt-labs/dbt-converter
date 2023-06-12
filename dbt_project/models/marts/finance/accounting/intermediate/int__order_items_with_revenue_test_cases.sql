with 

order_items as (

    select * from {{ ref('fct_salesforce_order_items') }}

),

test_lives_unioned as (

    select
        sfdc_order_item_id,
        sfdc_order_id,
        total_price,
        {{ dbt_utils.star(
            from=ref('fct_salesforce_order_items'), 
            except=[
                "sfdc_order_id", 
                "sfdc_order_item_id",
                "total_price"
            ]
        ) }},
        false as is_override

    from order_items

    union all

    -- The revenue accounting team developed intentional overrides to confirm the logic is working.
    -- We will remove this once validation by that stakeholder group is complete. 
    -- Source: https://docs.google.com/spreadsheets/d/1WDh3elcUw7QDiV3zciZe0XDBi0UO-pFjGNMHplrYaHM/edit#gid=0
    select
        concat(order_items.sfdc_order_item_id,'_override') as sfdc_order_item_id,
        concat(order_items.sfdc_order_id,'_override') as sfdc_order_id,
        case 
            when sfdc_order_item_id in ('8024v00000JeSfMAAV','8024v00000JeQP3AAN')
                then 4000
            else total_price
        end as total_price,
        {{ dbt_utils.star(
            from=ref('fct_salesforce_order_items'), 
            except=[
                "sfdc_order_id", 
                "sfdc_order_item_id",
                "total_price"
            ]
        ) }},
        true as is_override
    
    from order_items
    where order_items.sfdc_order_id in (
        '8014v000005dXShAAM',
        '8014v000005dWZxAAM'
    )

)

select * from test_lives_unioned