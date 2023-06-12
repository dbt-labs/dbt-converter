with

subscription_changes as (

    select * from {{ ref('stg_cloud_stripe__subscription_changes') }}

),

price_corrections as (

    select
        * exclude (price, quantity),

        --flags for if a plan change occurs mid-cycle.
            --we know this happens if their first plan type
            --in the cycle period is different than the last.
        first_value(plan_id) over (
                partition by subscription_id,plan_type,current_period_start
                order by created_at
        ) as usage_period_plan_type,

        case
            when usage_period_plan_type in ('base', 'pro_monthly')
            and plan_id = 'developer_license_monthly'
                then '14 Jan 20: Shifted to seat-based, mid-cycle change - do not charge'
            when usage_period_plan_type = 'developer_license_monthly'
            and plan_id = 'developer_license_monthly_2022'
                then '1 Feb 23: $50 to $100/seat, mid-cycle change - change seat price to $50'
        end as cost_change_comment,

        case
            when cost_change_comment ilike '1 Feb 23%'
                then 50
            when cost_change_comment ilike '14 Jan 20%'
                then null
            else price
        end as price,

        case
            when cost_change_comment ilike '14 Jan 20%'
                then null
            else quantity
        end as quantity

    from subscription_changes

),

cost_corrections as (

    select
        *,
        price * quantity as cost

    from price_corrections

),

lagged as (


    select
        *,
        row_number() over (
                partition by subscription_id, plan_type
                order by updated_at
        ) as change_event_index,

        row_number() over (
                partition by subscription_id,current_period_start,plan_type
                order by updated_at
        ) as sub_line_item_charge_index,

        lag(quantity) ignore nulls over (
                partition by subscription_id, plan_type
                order by updated_at
        ) as previous_quantity,

        lag(cost) ignore nulls over (
                partition by subscription_id, plan_type
                order by updated_at
        ) as previous_cost

    from cost_corrections

),

enriched as (

    select
        * exclude (change_event_index,sub_line_item_charge_index),
        (quantity - coalesce(previous_quantity,0)) as quantity_change,

        (cost - coalesce(previous_cost,0)) as cost_change,

        case
            when change_event_index = 1
                and cost > 0
                    then 'new'
            when cost_change is null
                then null

        --to account for Jan 14 pricing changes
        --e.g. stripe_customer_id = 'cus_G7FlqminVbRKQq' (paying less)
            when lag(usage_period_plan_type) over (
                partition by subscription_id, plan_type
                order by created_at) = 'pro_monthly'
                and plan_id = 'developer_license_monthly'
                and cost_change_comment is null
                and cost_change < 0
                then 'pricing change'
        --to account for Feb 20 pricing changes
            when lag(usage_period_plan_type) over (
                partition by subscription_id, plan_type
                order by created_at) = 'developer_license_monthly'
                and plan_id = 'developer_license_monthly_2022'
                and cost_change_comment is null
                and cost_change > 0
                then 'pricing change'

            when cost_change > 0
                then 'upgrade'
            when cost_change < 0
                then 'downgrade'
        end as subscription_change_type,

        case
            when canceled_at is not null
                then false
        --is it the first subscription line item charge?
            --this also removes occasions when there's a
            --subscription event but it's actually the payment change.
                -- e.g. invoice_id = 'in_1HwshaKS6Y3lIrasEaQ0y3PJ'
                --or invoice_id = 'in_1HwshaKS6Y3lIrasEaQ0y3PJ'
            when sub_line_item_charge_index = 1
                and cost != 0 and cost is not null
                then true
            --is it a change in the subscription line item?
            when cost_change > 0 or cost_change < 0
                then true
            else false
        end as is_subscription_change_event

    from lagged

)

select * from enriched
