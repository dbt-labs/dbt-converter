with

source as (

    select * from {{source('stripe', 'subscriptions')}}

),

renamed as (

    select
        id as subscription_id,
        customer as stripe_customer_id,
        
        plan['id']::varchar as stripe_plan_id,
        plan['interval']::varchar as plan_interval,
        plan['name']::varchar as stripe_plan_name,
        
        created as subscription_created_at,
        canceled_at as subscription_canceled_at

    from source

)

select * from renamed