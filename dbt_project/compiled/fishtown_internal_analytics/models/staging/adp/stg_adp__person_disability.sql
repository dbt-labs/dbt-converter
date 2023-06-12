with

source as (

    select * from raw.fivetran_adp_workforce_now.person_disability

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