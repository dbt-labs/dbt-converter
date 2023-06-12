with source as (

    select * from {{ source('fivetran_googlesheets', 'customer_health_score_buckets') }}

),

renamed as (

    select

        {{ dbt_utils.generate_surrogate_key([
            'metric_category',
            'general_metric',
            'sales_motion',
            'market_segment',
            'customer_tenure_min',
            'customer_tenure_max',
            'bucket_min',
            'bucket_max'
        ]) }} as customer_health_bucket_id,
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
