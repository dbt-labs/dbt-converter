with

source as (

    select * from {{ source('adp', 'business_communication') }}
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
