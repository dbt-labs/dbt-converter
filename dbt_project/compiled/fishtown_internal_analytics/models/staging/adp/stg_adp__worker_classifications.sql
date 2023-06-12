with

source as (

    select * from raw.fivetran_adp_workforce_now.worker_classification

),

renamed as (

    select
        id as classification_id,
        worker_assignment_id,
        worker_id,

        type
        
    from source

)

select * from renamed