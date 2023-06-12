with source as (

    select * from {{ source('fivetran_googlesheets', 'customer_health_score_overall_weights') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'metric_category',
            'sales_motion'
        ]) }} as customer_health_overall_weight_id,
        _row,
        metric_category,
        sales_motion,
        weight as overall_weight,
        _fivetran_synced

    from source

)

select * from renamed
