{% snapshot single_tenant_mappings_snapshot %}

    {{
        config(
          strategy='check',
          unique_key='unique_id',
          check_cols=['mapping_value'],
        )
    }}

    select * from {{ ref('single_tenant_mapping_unioned') }}

{% endsnapshot %}