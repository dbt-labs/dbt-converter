with

revenue_items as (

    select * from {{ ref('fct_managed_revenue_items') }}
    where is_product_excluded_from_revenue_waterfalls = false

),

accounting_pivot as (

    select * from {{ ref('int__pivot_accounting_amounts') }}

),


joined as (

    select
        revenue_items.*,
        {{ dbt_utils.star(from=ref('int__pivot_accounting_amounts'), except=["revenue_item_id"]) }}

    from revenue_items
    left join accounting_pivot
        on revenue_items.revenue_item_id = accounting_pivot.revenue_item_id

)

select * from joined