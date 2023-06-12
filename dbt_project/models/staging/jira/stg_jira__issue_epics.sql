{{
  config(
    materialized = 'table'
  )
}}

with

issue_fields as (

    select * from {{ ref('stg_jira__issue_field_histories') }}

),

issue_epics as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'issue_id',
            'field_value'
        ]) }} as issue_epic_id,
        issue_id,
        field_value as epic_id

    from issue_fields
    where field_name = 'Epic Link'
    and is_latest_field_value

)

select * from issue_epics