with

source as (

    select * from {{ source('adp', 'worker_classification') }}

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