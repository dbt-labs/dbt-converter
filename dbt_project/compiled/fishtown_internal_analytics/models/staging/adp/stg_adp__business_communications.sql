with

source as (

    select * from raw.fivetran_adp_workforce_now.business_communication
    where name = 'Work E-mail'
    
),

renamed as (

    select
        worker_id,
        name,
        email_uri as work_email

    from source

)

select * from renamed