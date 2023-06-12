with

tickets as (

    select * from {{ ref('stg_bizzabo__tickets') }}
    where is_deleted = false

),

registrations as (

    select * from {{ ref('fct_bizzabo_registrations') }}

),

registration_calcs as (

    select
        ticket_id,

        count(distinct
            case 
                when status = 'completed' then registration_id
                else null
            end
        ) as count_of_registrations,

        count(distinct
            case
                when status = 'completed' then contact_id
                else null
            end
        ) as count_of_contacts,

        count(distinct
            case
                when status = 'completed' then order_id
                else null
            end
        ) as count_of_completed_orders,

        count(distinct
            case
                when status = 'refunded' then order_id
                else null
            end
        ) as count_of_refunded_orders,

        sum(
            case
                when status = 'completed' then charge_amount
                else null
            end
        ) as total_revenue,

        sum(
            case
                when status = 'completed' then discount_amount
                else null
            end
        ) as total_discount,

        avg(
            case
                when status = 'completed' then charge_amount
                else null
            end
        ) as avg_order_amount,

        avg(
            case
                when status = 'completed' then discount_amount
                else null
            end
        ) as avg_discount_amount


    from registrations
    group by 1

),

joined as (

    select * from tickets
    left join registration_calcs using (ticket_id)

),

final_calcs as (

    select
        -- identifiers
        ticket_id,
        event_id,

        -- dimensions
        availability,
        availability_end,
        currency_code,
        description,
        name,
        per_order_max,
        per_order_min,
        price,
        quantity,
        registration_properties,
        sale_method,
        tax_rate,

        -- timestamps
        availability_end_at,
        availability_start_at,

        -- measures
        coalesce(count_of_registrations,0) as count_of_registrations,
        coalesce(count_of_completed_orders,0) as count_of_completed_orders,
        coalesce(count_of_refunded_orders,0) as count_of_refunded_orders,
        coalesce(count_of_contacts,0) as count_of_contacts,
        quantity - coalesce(count_of_registrations,0) as quantity_remaining,
        coalesce(total_revenue, 0) as total_revenue,
        coalesce(total_discount,0) total_discount,
        avg_order_amount,
        avg_discount_amount

    from joined

)

select * from final_calcs