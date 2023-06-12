with source as (

    select * from raw.fivetran_googlesheets.customer_health_score_category_weights

),

renamed as (

    select
        md5(cast(coalesce(cast(metric_category as TEXT), '') || '-' || coalesce(cast(general_metric as TEXT), '') || '-' || coalesce(cast(sales_motion as TEXT), '') as TEXT)) as customer_health_category_weight_id,
        _row,
        metric_category,
        general_metric,
        sales_motion,
        weight as category_weight,
        _fivetran_synced

    from source

)

select * from renamed