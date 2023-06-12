with

source as (

    select * from raw.fivetran_adp_workforce_now.worker_assigned_organizational_unit

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