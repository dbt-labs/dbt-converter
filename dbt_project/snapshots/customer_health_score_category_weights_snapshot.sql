{% snapshot customer_health_score_category_weights_snapshot %}

    {{
        config(
          strategy='timestamp',
          unique_key="concat_ws('|', metric_category, general_metric, sales_motion)",
          updated_at='_fivetran_synced'
        )
    }}

    select * from {{ source('fivetran_googlesheets', 'customer_health_score_category_weights') }}

{% endsnapshot %}
