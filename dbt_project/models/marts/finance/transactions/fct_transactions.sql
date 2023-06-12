{% set periods_datediff %}
    datediff(
        month,
        start_date,
        --need to adjust end_date by 1 day to get correct results
        --for contracts that start on the first day of a month
        case
            when date_part(day, start_date) = 1
                then dateadd(day, 1, end_date)
            else end_date
        end
        )
{% endset %}

with

proserv_engagements as (

    select * from {{ref('fct_services_delivery')}}
    where customer_id is not null
    and customer_name != 'dbt Labs'

),


stripe as (

    select * from {{ref('fct_stripe_invoices')}}

),

enterprise_invoices as (

    select * from {{ref('fct_invoice_line_items')}}
    --we use invoice lines so we can separate enterprise and service items
    where product_name != 'Overage Develop License'
    --we do not want to include Overages toward MRR
    and source ilike any ('salesforce', 'quickbooks%')

),

consulting as (

    select
        {{dbt_utils.generate_surrogate_key([
            'unique_id',
            'project_name'
        ])}} as transaction_id,
        'consulting' as category,
        unique_id::varchar(100) as invoice_id,
        customer_id,
        customer_id_type,
        customer_name,
        product_name as description,

        due_date as invoice_date,
        due_date as rev_rec_date,
        start_date,
        due_date as end_date,
        1 as periods,

        false as is_upgrade,
        null::varchar as sales_motion,
        cost as amount

    from proserv_engagements

),

cloud_self_service as (

    select
        {{dbt_utils.generate_surrogate_key([
            'invoice_id',
            'plan_name'
        ])}} as transaction_id,
        'dbt_cloud' as category,
        invoice_id::varchar as invoice_id,
        customer_id::varchar as customer_id,
        customer_id_type,
        customer_name,
        plan_name as description,

        invoice_date,
        invoice_date as rev_rec_date,
        invoice_period_start as start_date,
        invoice_period_end as end_date,
        1 as periods,

        (coalesce(invoice_description, '') = 'Subscription upgrade') as is_upgrade,
        'Self-Service' as sales_motion,
        case
            when is_paid_invoice
                then invoice_subtotal
            else 0
        end as amount

    from stripe
    where plan_id != 'free'

    union all

    select --accounting for occasions where self-service customers pay w. QB
        {{dbt_utils.generate_surrogate_key([
            'invoice_id',
            'description'
        ])}} as transaction_id,
        'dbt_cloud' as category,
        invoice_id::varchar as invoice_id,
        customer_id,
        customer_id_type,
        customer_name,
        description,

        invoice_date,
        start_date as rev_rec_date,
        start_date,
        end_date,
        1 as periods,

        case
            when description ilike '%upgrade%'
                then true
            else false
        end as is_upgrade,
        'Self-Service' as sales_motion,
        sum(amount) as amount

    from enterprise_invoices
    where transaction_type = 'self-service'
    {{ dbt_utils.group_by(n=11) }} 

),

cloud_enterprise as (

    select

        {{dbt_utils.generate_surrogate_key([
            'invoice_line_id',
            'description'
        ])}} as transaction_id,
        'dbt_cloud' as category,
        invoice_id::varchar(100) as invoice_id,
        customer_id::varchar(100) as customer_id,
        customer_id_type,
        customer_name,
        description,

        invoice_date,
        start_date as rev_rec_date,
        start_date,
        end_date,
        {{ periods_datediff }} as periods,

        false as is_upgrade,
        'Enterprise' as sales_motion,
        sum(amount) as amount

    from enterprise_invoices
    where transaction_type = 'enterprise'
    {{ dbt_utils.group_by(n=11) }} 

),

hosting as (

    select

        {{dbt_utils.generate_surrogate_key([
            'invoice_id',
            'description'
        ])}} as transaction_id,
        'hosted_snowplow' as category,
        invoice_id::varchar(100) as invoice_id,
        customer_id::varchar(100) as customer_id,
        customer_id_type,
        customer_name,
        description,

        invoice_date,
        start_date as rev_rec_date,
        start_date,
        end_date,
        {{ periods_datediff }} as periods,

        false as is_upgrade,
        null::varchar as sales_motion,
        amount

    from enterprise_invoices
    where transaction_type = 'snowplow'

),

unioned as (

    select * from consulting
    union all
    select * from cloud_self_service
    union all
    select * from hosting
    union all
    select * from cloud_enterprise

),

final as (

    select
        transaction_id,
        category,
        invoice_id as invoice_id,
        customer_id as customer_id,
        customer_id_type,
        customer_name,
        amount,
        description,
        invoice_date::date as invoice_date,
        rev_rec_date::date as rev_rec_date,
        start_date::date as start_date,
        end_date::date as end_date,
        periods,
        is_upgrade,
        sales_motion

    from unioned

)

select * from final
