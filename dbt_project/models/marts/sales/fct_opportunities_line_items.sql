/*
August 1, 2022 [from Brandon Thomson]
I'd like to move some of the logic in the staging layer to this model.
I'll work with the CS team to clarify some of that logic and make sure it's still relevant.
Stay tuned.
*/

with

line_items as (

    select * from {{ref('stg_salesforce__opportunity_line_items')}}

),

opps as (

    select * from {{ ref('stg_salesforce__opportunities') }}

),

accounts as (

    select * from {{ ref('stg_salesforce__accounts') }}
),

products as (

    select * from {{ ref('stg_salesforce__products') }}

),

joined as (

    select

        -- excluding here to allow for PS/T quantity-adjusted calc below
        line_items.* exclude list_price,
        opps.account_id,
        accounts.account_name,
        opps.amount as opportunity_amount,
        opps.is_won,
        opps.is_closed,
        opps.stage_name,
        opps.probability,
        opps.close_at,
        opps.forecast_category_name,
        opps.opportunity_type,
        opps.region,
        opps.has_technical_win,
        opps.contract_end_date as opportunity_term_end,
        opps.won_at as became_customer_on,
        products.product_family,
        products.product_type,
        products.product_description,
        products.unit,
        products.is_professional_services,
        products.is_training,
        case
            when products.is_professional_services or products.is_training
                then line_items.quantity * line_items.list_price
            else list_price
        end as list_price

    from line_items
    left join opps
        on line_items.opportunity_id = opps.opportunity_id
    left join accounts
        on opps.account_id = accounts.account_id
    left join products
        on line_items.product_id = products.product_id

)

select * from joined
