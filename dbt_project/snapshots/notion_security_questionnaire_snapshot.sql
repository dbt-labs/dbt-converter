{% snapshot notion_security_questionnaire_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='id',

      strategy='timestamp',
      updated_at='_sdc_received_at'
    )
}}

    select * from {{ source('notion', 'query_databases') }}
    where parent:database_id::string = '89723335-3391-4beb-b5e8-ea731160128d'

{% endsnapshot %}