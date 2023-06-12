with

issue_histories as (

    select * from {{ ref('base__jira_issue_field_multiselect_histories') }}

),

fields as (

    select * from {{ ref('stg_jira__fields') }}

),

field_options as (

    select * from {{ ref('stg_jira__field_options') }}

),

renamed as (

    select 
        {{ dbt_utils.star(
            from=ref('base__jira_issue_field_multiselect_histories'),
            except=["field_value"])
        }},

        case
            when fields.field_name = 'Environment'
                then 'dbt_environment'
            else fields.field_name
        end as field_name,
            --this is bc the field_histories also has environment.
            --this distinguishes the two bc this is specifically for the
            --dbt environment that the issue is addressing.
            --we need to do this bc we pivot these field names in the
            --`fct_jira_issue_field_values` model
            --(e.g. https://dbtlabs.atlassian.net/browse/IDE-232 vs SECURITY-68)

        coalesce(
            field_options.field_option_name,
            issue_histories.field_value
        ) as field_value

    from issue_histories
    left join fields using (field_id)
    left join field_options
        on issue_histories.field_value = field_options.field_option_id

)

select * from renamed