{% snapshot adp_worker_report_to_snapshot %}

{{
    config(
      unique_key='worker_assignment_id',
      strategy='timestamp',
      updated_at='_fivetran_synced'
    )
}}

    select * from {{ source('adp', 'worker_report_to') }}

{% endsnapshot %}