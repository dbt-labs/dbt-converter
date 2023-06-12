with

source as (

    select * from {{ source('asana', 'task_section') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key([
            'section_id',
            'task_id'
        ])}} as task_section_id,
        section_id,
        task_id

    from source

)

select * from renamed