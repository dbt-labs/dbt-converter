with source as (

    select * from {{ source('fivetran_googlesheets', 'customer_health_score_category_weights') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'metric_category',
            'general_metric',
            'sales_motion'
        ]) }} as customer_health_category_weight_id,
        _row,
        metric_category,
        general_metric,
        sales_motion,
        weight as category_weight,
        _fivetran_synced

    from source

)

select * from renamed