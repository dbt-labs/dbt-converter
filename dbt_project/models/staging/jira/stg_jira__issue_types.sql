with

source as (

    select * from {{ source('jira', 'issue_type') }}

),

renamed as (

    select 
        id::varchar as issue_type_id,
        name as issue_type_name,
        subtask as is_subtask,
        description as issue_type_description

    from source

)

select * from renamed