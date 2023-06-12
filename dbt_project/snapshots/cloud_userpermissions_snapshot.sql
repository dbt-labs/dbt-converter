{% snapshot cloud_userpermissions_snapshot %}

    {{
        config(
          strategy='timestamp',
          unique_key='id',
          updated_at='updated_at'
        )
    }}

    select * from {{ source('cloud_postgres', 'user_license') }}

{% endsnapshot %}
