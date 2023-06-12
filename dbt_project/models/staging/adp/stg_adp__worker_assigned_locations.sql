with

source as (

    select * from {{ source('adp', 'worker_assigned_location') }}

),

renamed as (

    select 
        id as location_id,
        worker_assignment_id,
        worker_id

    from source

)

select * from renamed