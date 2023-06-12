with 

order_items as (

    select * from {{ ref('fct_salesforce_order_items') }}

),

credit_note_items as (

    select * from {{ ref('fct_salesforce_credit_note_items') }}

),

rev_schedules as (

    select * from {{ ref('stg_salesforce__rev_schedules') }}
    where is_deleted = false

),

rev_schedule_overrides as (

    select * from {{ ref('int__enriching_rev_schedule_overrides') }}

),

opps as (

    select * from {{ ref('fct_opportunities') }}

),

delivered_service_line_items as (

    select * from {{ ref('fct_opportunities_line_items') }}
    where services_delivered_by_id is not null

),

onboarding_events as (

    select * from {{ ref('fct_customer_onboarding_events') }}

),

allocations as(

    select * from {{ ref('fct_revenue_allocations') }}

),

joined as (

    select

        rev_schedules.sfdc_rev_schedule_id,
        rev_schedules.revenue_schedule_code,
        order_items.order_number,
        order_items.sfdc_order_id,

        order_items.order_item_number,
        credit_note_items.credit_note_name,

        order_items.sfdc_order_item_id,

        order_items.sfdc_opportunity_id,
        order_items.sfdc_account_id,
    
        order_items.billing_city,
        order_items.billing_state,
        order_items.billing_state_code,
        order_items.billing_postal_code,
        order_items.billing_country,
        order_items.billing_country_code,
        order_items.billing_region,
        order_items.shipping_city,
        order_items.shipping_state,
        order_items.shipping_state_code,
        order_items.shipping_postal_code,
        order_items.shipping_country,
        order_items.shipping_country_code,
        order_items.shipping_region,

        coalesce(
            order_items.product_name,
            credit_note_items.product_name,
            rev_schedules.product_name
        ) as product_name,

        coalesce(
            order_items.product_type,
            credit_note_items.product_type
        ) as product_type,

        coalesce(
            order_items.product_family,
            credit_note_items.product_family,
            rev_schedules.product_category
        ) as product_family,
        
        order_items.total_price,
        coalesce(
            order_items.credit_note_credit,
            credit_note_items.credit_note_credit
        ) as credit_note_credit,
        coalesce(
            order_items.credit_note_debit,
            credit_note_items.credit_note_debit
        ) as credit_note_debit,
        coalesce(
            order_items.invoice_credit,
            credit_note_items.invoice_credit
        ) as invoice_credit,
        coalesce(
            order_items.invoice_debit,
            credit_note_items.invoice_debit
        ) as invoice_debit,
        coalesce(
            order_items.payment_credit,
            credit_note_items.payment_credit
        ) as payment_credit,            
        coalesce(
            order_items.payment_debit,
            credit_note_items.payment_debit
        ) as payment_debit,  
        coalesce(
            order_items.refund_credit,
            credit_note_items.refund_credit
        ) as refund_credit,  
        coalesce(
            order_items.refund_debit,
            credit_note_items.refund_debit
        ) as refund_debit,
        coalesce(
            order_items.rev_rec_credit,
            credit_note_items.rev_rec_credit
        ) as rev_rec_credit,
        coalesce(
            order_items.rev_rec_debit,
            credit_note_items.rev_rec_debit
        ) as rev_rec_debit,

        opps.account_name,
        opps.opportunity_name,
        opps.opportunity_type,
        opps.contract_start_date,
        opps.contract_end_date,
        opps.close_date as opportunity_close_date,

        -- TODO: bring in newly-made SFDC sign-date and need to backfill with close date and overrides
        -- to enable BI filtering on sign date. Looker is already using this and the stakeholders are 
        -- engaging with the dashboard, so I don't want to degrade sign_date until I provide a swap-out date. 
        opps.close_date as sign_date,

        rev_schedules.order_product_start_date,

        rev_schedules.total_revenue_amount as total_revenue_amount,

        rev_schedules.revenue_start_date,
        rev_schedules.revenue_end_date

    from rev_schedules
    left join order_items
        on rev_schedules.sfdc_order_item_id = order_items.sfdc_order_item_id
        and order_status != 'Cancelled'
    left join credit_note_items
        on rev_schedules.sfdc_credit_note_item_id = credit_note_items.sfdc_credit_note_item_id
    left join opps
        on order_items.sfdc_opportunity_id = opps.opportunity_id

),

with_overrides_and_allocations as (

    select

        joined.sfdc_rev_schedule_id,
        joined.revenue_schedule_code,

        -- credit notes have overrides to be associated with specific orders
        -- as they have been historically in Excel revenue recognition
        coalesce(
            rev_schedule_overrides.order_number,
            joined.order_number
        ) as order_number,
        coalesce(
            rev_schedule_overrides.sfdc_order_id,
            joined.sfdc_order_id
        ) as sfdc_order_id,

        joined.order_item_number,
        joined.credit_note_name,

        joined.sfdc_order_item_id,

        joined.sfdc_opportunity_id,
        joined.sfdc_account_id,
    
        joined.billing_city,
        joined.billing_state,
        joined.billing_state_code,
        joined.billing_postal_code,
        joined.billing_country,
        joined.billing_country_code,
        joined.billing_region,
        joined.shipping_city,
        joined.shipping_state,
        joined.shipping_state_code,
        joined.shipping_postal_code,
        joined.shipping_country,
        joined.shipping_country_code,
        joined.shipping_region,

        joined.product_name,
        joined.product_type,
        joined.product_family,
        case
            when joined.product_name ilike any ('%Event%', '%Coalesce%')
                then true
            else false
        end as is_product_excluded_from_revenue_waterfalls,
        joined.total_price as total_order_item_price,
        joined.credit_note_credit,
        joined.credit_note_debit,
        joined.invoice_credit,
        joined.invoice_debit,
        joined.payment_credit,
        joined.payment_debit,
        joined.refund_credit,
        joined.refund_debit,
        joined.rev_rec_credit,
        joined.rev_rec_debit,

        joined.account_name,
        joined.opportunity_name,
        joined.opportunity_type,
        joined.contract_start_date,
        joined.contract_end_date,
        joined.opportunity_close_date,
        joined.sign_date,

        joined.order_product_start_date,

        joined.total_revenue_amount as total_order_product_amount_raw,
        allocations.order_revenue_allocation_method,
        coalesce(
            allocations.is_order_item_reallocated, 
            false
        ) as is_related_order_item_reallocated,
        is_related_order_item_reallocated and {{ var('reflect_allocation') }} as is_revenue_item_reallocated,
        case
            when is_related_order_item_reallocated
                then allocations.allocated_revenue
            else null
        end as revenue_amount_reallocation_override,
        coalesce(
            rev_schedule_overrides.revenue_amount,
            case
                when is_product_excluded_from_revenue_waterfalls
                    then 0
                when is_revenue_item_reallocated
                    then revenue_amount_reallocation_override
                else null
            end, 
            total_order_product_amount_raw,
            total_order_item_price
        ) as total_order_product_amount_reflecting_overrides,

        coalesce(
            rev_schedule_overrides.revenue_start_date,
            joined.revenue_start_date
        ) as revenue_start_date,

        coalesce(
            rev_schedule_overrides.revenue_end_date,
            joined.revenue_end_date
        ) as revenue_end_date,

        coalesce(
            joined.opportunity_close_date,
            rev_schedule_overrides.revenue_start_date,
            joined.revenue_start_date
        ) as billing_period_date,

        coalesce(
            rev_schedule_overrides.initial_catch_up_date,
            joined.opportunity_close_date,
            rev_schedule_overrides.revenue_start_date,
            joined.revenue_start_date,
            '01/01/1900'
            
        ) as initial_catch_up_date,

        coalesce(
            rev_schedule_overrides.final_rollup_date,
            '12/31/9999'
        ) as final_rollup_date,

-- Note that Service line items are recognized at completion of the work,
-- which is processed by accounting/operations teams by creating specific
-- SFDC Revenue Transactions, which are integrated in fct_revenue_recognition_daily

        case
            when rev_schedule_overrides.sfdc_rev_schedule_id is not null
                then 'Manual Schedule Override'
            when joined.product_family = 'Services'
                then 'Salesforce Revenue Transactions'
            when joined.sfdc_rev_schedule_id is not null
                then 'Salesforce Revenue Schedule'
            -- anything without the prior recognition types should be excluded from
            -- later recognition steps
            else 'No Recognition Method Indicated'
        end as accounting_recognition_type,

        rev_schedule_overrides.revenue_per_day as revenue_per_day_override,
        rev_schedule_overrides.sfdc_rev_schedule_id is not null as is_override,
        rev_schedule_overrides.comment,
        case
            when joined.product_name ilike '%Reseller%'
                then 'Reseller Subscription'
            when joined.product_type in ('enterprise', 'other')
                then 'SFDC Subscription Revenue'
            when joined.product_type in ('services', 'professional services', 'training')
                then 'SFDC Services Revenue'
            when joined.product_family = 'Packages'
                then 'SFDC Subscription Revenue'
            when joined.product_name ilike any ('%dbt Learn%', '% PS %','%Office Hours%')
                then 'SFDC Services Revenue'
            when joined.product_name ilike any ('%License%', '%Virtual Private%')
                then 'SFDC Subscription Revenue'
            else null
        end as revenue_bucket,

        case
            when revenue_bucket = 'SFDC Services Revenue'
                then 'PS&T'
            when revenue_bucket in ('SFDC Subscription Revenue', 'Reseller Subscription')
                then 'Subscription'

            else null
        end as rpo_bucket

    from joined
    left join rev_schedule_overrides
        on joined.sfdc_rev_schedule_id = rev_schedule_overrides.sfdc_rev_schedule_id
    left join allocations
        on joined.sfdc_order_item_id = allocations.sfdc_order_item_id

),

refined as (

    select
        sfdc_rev_schedule_id,
        revenue_schedule_code,
        order_number,
        order_item_number,
        credit_note_name,
        account_name,
        opportunity_name,
        opportunity_type,
        opportunity_close_date,
        sign_date,
        billing_period_date,
        initial_catch_up_date,
        final_rollup_date,
        product_name,
        product_type,
        product_family,
        is_product_excluded_from_revenue_waterfalls,
        revenue_bucket,
        rpo_bucket,

        credit_note_credit,
        credit_note_debit,
        invoice_credit,
        invoice_debit,
        payment_credit,
        payment_debit,
        refund_credit,
        refund_debit,
        rev_rec_credit,
        rev_rec_debit,

        revenue_start_date,
        revenue_end_date,

        datediff(
            day,
            revenue_start_date,
            revenue_end_date
        )+1 as total_rs_days,

        total_order_item_price,
        total_order_product_amount_raw,
        order_revenue_allocation_method,
        is_related_order_item_reallocated,
        is_revenue_item_reallocated,
        revenue_amount_reallocation_override,
        total_order_product_amount_reflecting_overrides,
        
        accounting_recognition_type,

 -- If there is not a flat daily recognition approach, then these fields should be 0.

        coalesce(
            revenue_per_day_override,
            case
                when accounting_recognition_type in ('Salesforce Revenue Schedule', 'Manual Schedule Override')   
                    then round(
                            total_order_product_amount_reflecting_overrides/nullif(total_rs_days,0),
                            2)
                else 0
            end
         ) as revenue_per_day,

        case
            when accounting_recognition_type in ('Salesforce Revenue Schedule', 'Manual Schedule Override')  
                then greatest(
                        initial_catch_up_date - revenue_start_date,
                        0
                    )
            else 0
        end as initial_catch_up_days_unbounded,

        least(
            initial_catch_up_days_unbounded,
            total_rs_days
        ) as initial_catch_up_days,

        round(
              initial_catch_up_days * revenue_per_day,
              2
        ) as initial_catch_up_amount,

        case
            when final_rollup_date is not null
                then greatest(
                        revenue_end_date - final_rollup_date,
                        0
                    )
            else 0
        end as final_rollup_days_unbounded,

        least(
            final_rollup_days_unbounded,
            total_rs_days
        ) as final_rollup_days,

        round(
              final_rollup_days * revenue_per_day,
              2
        ) as final_rollup_amount,       

        case
            when revenue_per_day_override is not null
                then 0
            when accounting_recognition_type in ('Salesforce Revenue Schedule', 'Manual Schedule Override')  
                then round(
                        total_order_product_amount_reflecting_overrides - (revenue_per_day * total_rs_days),
                        2
                     ) 
            else 0
        end as final_true_up_amount,

        sfdc_order_item_id,
        sfdc_order_id,
        sfdc_opportunity_id,
        sfdc_account_id,
        billing_city,
        billing_state,
        billing_state_code,
        billing_postal_code,
        billing_country,
        billing_country_code,
        billing_region,
        shipping_city,
        shipping_state,
        shipping_state_code,
        shipping_postal_code,
        shipping_country,
        shipping_country_code,
        shipping_region

    from with_overrides_and_allocations

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'sfdc_order_item_id',
            'sfdc_rev_schedule_id'
        ])}} as revenue_item_id,
        *
    from refined

)

select * from with_id