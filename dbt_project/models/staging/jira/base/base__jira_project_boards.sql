with

source as (

    select * from {{ source('jira', 'project_board') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key([
            'project_id',
            'board_id'
        ])}} as project_board_id,
        project_id,
        board_id

    from source
    where not _fivetran_deleted

)

select * from renamed