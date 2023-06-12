{% snapshot stripe_customers_snapshot %}

    {{
        config(
          strategy = 'timestamp',
          unique_key = 'id',
          updated_at = '_sdc_batched_at'
        )
    }}

    select * from {{ source('stripe', 'customers') }}

{% endsnapshot %}
