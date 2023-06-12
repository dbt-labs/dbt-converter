with

source as (

    select * from raw.fivetran_jira.issue_field_history

),

renamed as (

    select
        md5(cast(coalesce(cast(issue_id as TEXT), '') || '-' || coalesce(cast(field_id as TEXT), '') || '-' || coalesce(cast(time as TEXT), '') as TEXT)) as issue_field_history_id,

        md5(cast(coalesce(cast(issue_id as TEXT), '') || '-' || coalesce(cast(field_id as TEXT), '') as TEXT)) as issue_field_id,

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