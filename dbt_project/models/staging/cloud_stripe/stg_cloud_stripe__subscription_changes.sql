with

events as (

    select * from {{ ref('base__cloud_stripe_events') }}

),

flattened as (

    select
        events.*,
        data:object:id::varchar as subscription_id,
        data:object:customer::varchar as stripe_customer_id,
        data:object:latest_invoice::varchar as invoice_id,
        data:previous_attributes:latest_invoice::varchar as previous_invoice_id,
        value:plan:id::varchar as plan_id,
        value:plan:name::varchar as plan_name,
        case
            when plan_id in (
                'developer_license_monthly_2022',
                'developer_license_monthly',
                'pro_monthly',
                'base'
                )
                then 'subscription'
            else plan_name
        end as plan_type,
            --We changed from Basic Subscription to using Monthly Developer License
            --on 2020 Jan 14, so we want to bucket these plan types together
            --(see invoice_id = 'in_1FuJzfKS6Y3lIrasiObjNXfG')
            --likewise from Pro Subscription to Developer License
            --(see invoice_id = 'in_1FhIsSKS6Y3lIrasJ8lFMveH')
        data:object:status::varchar as charge_status,

        case
            when charge_status != 'active'
                then false
            else true
        end as is_active_charge,

        data:previous_attributes:status::varchar as previous_charge_status,

        data:object:current_period_start::timestamp_ntz as current_period_start,
        data:object:current_period_end::timestamp_ntz as current_period_end,
        data:object:canceled_at::timestamp_ntz as canceled_at,

        value:quantity::integer as quantity,
        value:plan:amount::float / 100 as price

    from events,
    lateral flatten(input=>data:object:items)

    where event_type ilike '%subscription%'

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'event_id',
            'plan_id'
        ]) }} as unique_id,
        *

    from flattened

)

select * from with_id