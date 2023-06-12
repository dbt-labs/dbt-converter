with

user_emails as (

    select * from raw.fivetran_greenhouse.user_email
    where is_primary = true 

),

synth as (

    select 
        user_id as greenhouse_user_id,
        email as user_email

    from user_emails

)


select * from synth