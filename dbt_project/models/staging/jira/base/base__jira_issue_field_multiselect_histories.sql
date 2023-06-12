with

source as (

    select * from {{ source('jira', 'issue_multiselect_history') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key([
            '_FIVETRAN_ID',
            'time'
        ])}} as issue_field_multiselect_history_id,

        {{dbt_utils.generate_surrogate_key([
            'issue_id',
            'field_id'
        ])}} as issue_field_id,

        "_FIVETRAN_ID" as fivetran_id,
        issue_id,
        field_id,
        author_id,

        value as field_value,
        is_active,

        "TIME" as updated_at,

        row_number() over (
            partition by issue_field_id
            order by updated_at) = 1
        as is_first_field_value,

        row_number() over (
            partition by issue_field_id
            order by updated_at desc) = 1
        as is_latest_field_value

    from source

)

select * from renamed