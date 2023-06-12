with

source as (

    select * from {{source('fivetran_googlesheets', 'training_private_learners')}}
    -- the below filter is required since Fivetran will sometimes sync blank rows if any activity has occurred in them
    -- it is required (in the Google Sheet) to have an email for every row, so our data model aligns with this requirement
    where email is not null

),

renamed as (

    select
        "_ROW"::varchar as id,
        training_type as course_type,
        company_name || '-' || training_type as course_name,

        full_name,
        first_name,
        last_name,
        company_title,
        company_name,
        sf_username,
        email,
        personal_email,
        split_part(personal_email, '@', '-1') as email_domain,

        case
            when current_date() >= end_date
                then 1
        end as percentage_completed,

        case
            when percentage_completed = 1
                then true
            else false
        end as is_completed,

        start_date,
        end_date

    from source

)

select * from renamed
