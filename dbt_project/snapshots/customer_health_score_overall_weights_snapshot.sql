{% snapshot customer_health_score_overall_weights_snapshot %}

    {{
        config(
          strategy='timestamp',
          unique_key="concat_ws('|',metric_category,sales_motion)",
          updated_at='_fivetran_synced'
        )
    }}

    select * from {{ source('fivetran_googlesheets', 'customer_health_score_overall_weights') }}

{% endsnapshot %}
