with

source as (

    select * from {{ source('adp', 'worker_assigned_organizational_unit') }}

),

renamed as (

    select
        id as organizational_unit_id,
        worker_assignment_id,
        worker_id,

        _fivetran_synced

    from source

)

select * from renamed