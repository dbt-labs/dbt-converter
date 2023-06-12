with

worker_assigned_locations as (

    select * from {{ ref('stg_adp__worker_assigned_locations') }}

),

locations as (

    select * from {{ ref('int_adp_locations') }}

),

workers_with_locations as (

    select 
        worker_assigned_locations.worker_assignment_id,
        worker_assigned_locations.worker_id,
        locations.*

    from worker_assigned_locations
    left join locations
        on worker_assigned_locations.location_id = locations.location_id 

)

select * from workers_with_locations