{%- snapshot cloud_account_domains_snapshot -%}

{{
    config(
      target_schema = 'snapshots',
      unique_key = 'account_domain_id',
      
      strategy = 'check',
      check_cols = [
        'account_domain_id', 'account_id', 'email_domain', 'database_type',
        'database_source', 'salesforce_account_id', 'override_sfdc_account_id'
      ]
    )
}}

select * from {{ ref('int_account_domains__aggregated') }}

{%- endsnapshot -%}