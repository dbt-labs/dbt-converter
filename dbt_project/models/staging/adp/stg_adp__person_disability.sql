with

source as (

    select * from {{ source('adp', 'person_disability') }}

),

renamed as (

    select
        worker_id,

        case
            when value = 'Y'
                then 'Yes'
            when value = 'N'
                then 'No'
            when value = 'D'
                then 'Prefer not to say'
            else null
        end as disability
    
    from source

)

select * from renamed