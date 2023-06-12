{% snapshot adp_worker_base_remuneration_snapshot %}

{{
    config(
      unique_key='worker_assignment_id',
      strategy='timestamp',
      updated_at='_fivetran_synced',

      post_hook="{% if target.user == 'dbt_cloud_user' %}{{ dbt_snow_mask.apply_masking_policy('snapshots') }}{% endif %}"
    )
}}

    select * from {{ source('adp', 'worker_base_remuneration') }}

{% endsnapshot %}