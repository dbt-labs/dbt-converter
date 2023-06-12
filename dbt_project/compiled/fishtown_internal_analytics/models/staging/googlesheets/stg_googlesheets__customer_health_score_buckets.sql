with source as (

    select * from raw.fivetran_googlesheets.customer_health_score_buckets

),

renamed as (

    select

        md5(cast(coalesce(cast(metric_category as TEXT), '') || '-' || coalesce(cast(general_metric as TEXT), '') || '-' || coalesce(cast(sales_motion as TEXT), '') || '-' || coalesce(cast(market_segment as TEXT), '') || '-' || coalesce(cast(customer_tenure_min as TEXT), '') || '-' || coalesce(cast(customer_tenure_max as TEXT), '') || '-' || coalesce(cast(bucket_min as TEXT), '') || '-' || coalesce(cast(bucket_max as TEXT), '') as TEXT)) as customer_health_bucket_id,
        _row,
        metric_category,
        general_metric,
        sales_motion,
        market_segment,
        customer_tenure_min,
        customer_tenure_max,
        bucket_min,
        bucket_max,
        bucket_score,
        
        _fivetran_synced

    from source

)

select * from renamed