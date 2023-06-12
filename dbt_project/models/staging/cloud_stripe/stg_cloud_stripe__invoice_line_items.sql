with

source as (
    
    select * from {{source('stripe', 'invoice_line_items')}}
    
),

renamed as (
    
    select
        {{ dbt_utils.generate_surrogate_key([
            'invoice',
            'id'
        ]) }} as unique_id,

        id as line_item_id,
        invoice as invoice_id,
        subscription as subscription_id,
        subscription_item as subscription_item_id,

        description as invoice_line_description,
        type as line_item_type,

        case
            when invoice_line_description ilike '%sales%tax'
                then 'sales tax'
            when invoice_line_description ilike '%subscription upgrade%'
                then 'subscription upgrade'
            when proration
                then 'proration'
            when subscription_id is not null
                and line_item_type = 'subscription'
                then 'subscription item'
            else line_item_type
        end as line_item_subtype,

        plan,
        proration,

        amount/100 as item_amount,

        currency,
        quantity,

        period:start::timestamp_ntz as period_start_date,
        period:end::timestamp_ntz as period_end_date

    from source
    
)

select * from renamed