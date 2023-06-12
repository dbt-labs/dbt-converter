{%- snapshot adp_worker_assigned_departments_snapshot -%}

{{
    config(
      target_schema = 'snapshots',
      unique_key = "worker_assignment_id || '-' || worker_id",
      
      strategy = 'check',
      check_cols = ['check_key']
    )
}}

{{ adp_join_organizational_units(organizational_level = 'Department') }}

{%- endsnapshot -%}