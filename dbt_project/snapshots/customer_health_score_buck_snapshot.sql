{% snapshot customer_health_score_buck_snapshot %}

    {{
        config(
          strategy='timestamp',
          unique_key="concat_ws('|',metric_category,
            general_metric,
            sales_motion,
            market_segment,
            customer_tenure_min,
            customer_tenure_max,
            bucket_min,
            bucket_max)",
          updated_at='_fivetran_synced'
        )
    }}

    select * from {{ source('fivetran_googlesheets', 'customer_health_score_buckets') }}

{% endsnapshot %}
