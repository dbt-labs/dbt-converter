with

users as (
    
    select * from {{ ref('stg_greenhouse__users') }}
    
),

user_emails as (

    select * from {{ ref('stg_greenhouse__user_emails') }}

),

synth as (

    select 
        users.*,
        user_emails.user_email 
        
    from users
    left join user_emails
        on users.greenhouse_user_id = user_emails.greenhouse_user_id

)


select * from synth