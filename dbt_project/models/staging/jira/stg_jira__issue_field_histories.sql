with

issue_histories as (

    select * from {{ ref('base__jira_issue_field_histories') }}

),

fields as (

    select * from {{ ref('stg_jira__fields') }}

),

field_options as (

    select * from {{ ref('stg_jira__field_options') }}

),

issue_types as (

    select * from {{ ref('stg_jira__issue_types') }}

),

statuses as (

    select * from {{ ref('stg_jira__statuses') }}

),

renamed as (

    select 
        {{ dbt_utils.star(
            from=ref('base__jira_issue_field_histories'),
            except=["field_value"])
        }},

        case
            when fields.field_name = 'Environment'
                then 'environment_description' --see above comment
            when fields.field_name ilike '%Σ%'
                then replace(fields.field_name, 'Σ', 'sum')
            else replace(fields.field_name, '%', 'pct')
        end as field_name,
            --this is bc the multiselect_field_histories also has environment.
            --this distinguishes the two bc this is the environment that's found
            --in the description box, not as a label
            --we need to do this bc we pivot these field names in the
            --`fct_jira_issue_field_values` model
            --(e.g. https://dbtlabs.atlassian.net/browse/IDE-232 vs SECURITY-68)

        case
            when field_id = 'issuetype'
                then issue_types.issue_type_name
            when field_id = 'customfield_10033' --Severity (Security-Related)
                then field_options.field_option_name
            when field_id = 'status'
                then statuses.status_name
            else coalesce(
                    field_options.field_option_name,
                    issue_histories.field_value)
        end as field_value

    from issue_histories
    left join fields using (field_id)
    left join field_options
        on issue_histories.field_value = field_options.field_option_id
    left join issue_types
        on issue_histories.field_value = issue_types.issue_type_id
    left join statuses
        on issue_histories.field_value = statuses.status_id

)

select * from renamed