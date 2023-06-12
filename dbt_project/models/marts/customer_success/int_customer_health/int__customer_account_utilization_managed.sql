with

opp_line_items as (

    select * from {{ ref('fct_opportunities_line_items') }}
    where is_won
        and opportunity_type != 'Service'
        and product_name ilike '%License%'

),

revised as (

    select
        opportunity_line_item_id,
        opportunity_id,
        account_id,
        opportunity_type,
        product_name,
        product_code,
        quantity,
        close_at,

        lead(case when opportunity_type = 'Renew' then close_at end) ignore nulls over (
            partition by account_id, product_name
            order by close_at
        ) as next_renew_close_at,

        case
            when opportunity_type in ('Land','Expand')
                and ends_on > next_renew_close_at
                then next_renew_close_at
            else ends_on
        end as ends_on

    from opp_line_items
)

select * from revised