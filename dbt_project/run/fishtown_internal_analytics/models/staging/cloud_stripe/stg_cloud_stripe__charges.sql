
  create or replace   view analytics_dev.dbt_jstein.stg_cloud_stripe__charges
  
   as (
    with source as (

    select * from raw.dbt_cloud_stripe.charges

),

renamed as (

    select

        id as charge_id,
        invoice as invoice_id,
        customer as customer_id,

        amount::float / 100 as invoice_total,
        
        --coalesce(metadata:Tax_Calculated::float, 0) as sales_tax_calculated,
        --DO NOT include sales tax in this model.
        --Charges will calculate sales tax, but it does not mean that the 
        --we actually charge a sales tax
        -- example: invoice_id = 'in_1KemD9KS6Y3lIrasi2bdc4Wl'
        amount_refunded::float / 100 as refund_total,
        failure_message as cc_failure_message,
        failure_code as cc_failure_code,
        
        -- the below parses the credit card expiration month and year for each charge
        -- a coalesec statement is needed since failed payments won't have a source
        -- for these instances, we will pull the expiration date from the attempted payment method
        coalesce(
            source:exp_month::string,
            payment_method_details:card:exp_month::string
        ) as cc_expiration_month,

        coalesce(
            source:exp_year::string,
            payment_method_details:card:exp_year::string
        ) as cc_expiration_year,
        last_day(
            to_date(
                concat(cc_expiration_year, '-', cc_expiration_month, '-01')
            )
        ) as cc_expiration_date,
        
        created as created_at

    from source

)

select * from renamed
  );

