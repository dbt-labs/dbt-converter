with

rev_schedule as (

    select * from {{ ref('base__salesforce_rev_schedule') }}

),

rev_treatment as (

    select * from {{ ref('stg_salesforce__rev_rec_treatment') }}

),

rev_distrib_method as (

    select * from {{ ref('stg_salesforce__rev_distribution_method') }}

),

rev_schedule_joined as (

    select
        rev_schedule.*,

        rev_treatment.rev_rec_treatment_name,
        rev_treatment.billing_type as processing_order_num,
        rev_treatment.billing_type as rev_rec_treatment_billing_type,
        rev_distrib_method.rev_distribution_method_name,
        rev_distrib_method.rev_distribution_method_type,
        rev_distrib_method.billing_type

    from rev_schedule
    left join rev_treatment
        on rev_schedule.sfdc_rev_rec_treatment_id = rev_treatment.sfdc_rev_rec_treatment_id
    left join rev_distrib_method
        on rev_treatment.sfdc_rev_distribution_method_id
            = rev_distrib_method.sfdc_rev_distribution_method_id

)

select * from rev_schedule_joined