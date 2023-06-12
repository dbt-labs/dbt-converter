with

source as (

    select * from raw.fivetran_greenhouse.department
    where _fivetran_deleted = false

),

augment as (

    select 
        source.id as l0_department_id,
        source.name as l0_department_name,
        parents.id as l1_department_id,
        parents.name as l1_department_name

    from source
    left join source as parents
        on source.parent_id = parents.id

)

select * from augment