with

source as (

    select * from raw.fivetran_adp_workforce_now.worker_assigned_location

),

renamed as (

    select 
        id as location_id,
        worker_assignment_id,
        worker_id

    from source

)

select * from renamed