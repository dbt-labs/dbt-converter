with

issue_fields as (

    select * from {{ ref('stg_jira__issue_field_histories') }}

),

issue_multiselect_fields as (

    select * from {{ ref('stg_jira__issue_field_multiselect_histories') }}

),

--------------------- Multi-Input Fields

multiselect_fields_agg as (

    select
        issue_id,
        field_name,

        listagg(field_value,', ') within group (
            order by field_value
        ) as field_values

    from issue_multiselect_fields
    where is_active
    group by 1,2

),

multiselect_fields_pivoted as (

    select
        issue_id,
        {{ dbt_utils.pivot(
            'field_name',
            dbt_utils.get_column_values(ref('stg_jira__issue_field_multiselect_histories'), 'field_name'),
            agg='max',
            then_value='multiselect_fields_agg.field_values',
            else_value='null',
            quote_identifiers=False
        ) }}
    from multiselect_fields_agg
    group by issue_id

),

--------------------- Single Input Fields

single_fields_pivoted as (

    select
        issue_id,
        {{ dbt_utils.pivot(
            'field_name',
            dbt_utils.get_column_values(ref('stg_jira__issue_field_histories'), 'field_name'),
            agg='max',
            then_value='field_value',
            else_value='null',
            quote_identifiers=False
        ) }}
    from issue_fields
    where is_latest_field_value
    group by issue_id

),

issue_field_security as (

    select distinct
        issue_id,
        min(updated_at) over (
            partition by issue_id
            order by updated_at
        ) as severity_security_start_at,

        last_value(field_value) over (
            partition by issue_id
            order by updated_at
        ) as current_security_severity_level

    from issue_fields
    where field_name = 'Severity (Security Related)'
    and field_value is not null

),

joined as (

    select *
    from single_fields_pivoted
    left join multiselect_fields_pivoted using (issue_id)
    left join issue_field_security using (issue_id)

)

select * from joined