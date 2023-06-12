with

source as (

    select * from {{ source('asana', 'project_task') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key([
            'project_id',
            'task_id'
        ])}} as project_task_id,
        project_id,
        task_id

    from source

)

select * from renamed