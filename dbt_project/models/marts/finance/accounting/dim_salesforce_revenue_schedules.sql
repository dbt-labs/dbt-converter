with

revenue_schedules as (

    select * from {{ ref('stg_salesforce__rev_schedules') }}
    where is_deleted = False

),

refined as (

    select
        sfdc_rev_schedule_id,
        revenue_schedule_code,
        revenue_start_date,
        revenue_end_date,
        total_revenue_amount,
        opportunity_name,

        sfdc_order_item_id,
        order_product_start_date,
        product_name,
        product_category,

        credit_account_line_1,
        credit_account_line_2,
        debit_account_line_1,
        debit_account_line_2,

        sfdc_rev_rec_treatment_id,
        rev_rec_treatment_name,
        processing_order_num,
        rev_rec_treatment_billing_type,
        rev_distribution_method_name,
        rev_distribution_method_type,
        billing_type,

        created_at,
        created_by_id,
        owner_id

    from revenue_schedules

)

select * from refined