with

source as (

    select * from {{ source('fivetran_google_sheets_dei', 'diversity_form_responses') }}

),

renamed as (

    select
        _row as sheet_row_id,

        -- Align internal emails around dbtlabs domain
        replace(email_address, '@fishtownanalytics.com', '@dbtlabs.com') as email_address,
        
        do_you_have_significant_care_responsibilities_ as caregiver,
        do_you_have_a_disability_ as disability,
        do_you_identify_as_a_member_of_the_lgbtqia_community_ as lgbtqia,
        what_is_your_gender_identity_ as gender_identity,
        what_is_the_highest_degree_or_level_of_school_you_have_completed_ as highest_education,
        what_is_your_racial_or_ethnic_identity_ as racial_identity,

        timestamp::date as submitted_at

    from source

),

most_recent_response as (

    select * from renamed
    qualify row_number() over (partition by email_address order by submitted_at desc) = 1

),

final as (

    select
        sheet_row_id,
        email_address,
        caregiver,
        disability,

        case
            when sheet_row_id in (156, 246)
                then 'Not LGBTQIA'
            when lgbtqia in ('No', 'Heterosexual')
                then 'Not LGBTQIA'
            when lgbtqia in ('Yes', 'Bisexual', 'Queer - Bisexual', 'Homosexual')
                then 'LGBTQIA'
            else lgbtqia
        end as lgbtqia,
        
        case
            when sheet_row_id = 39
                then 'Non-binary or agender'
            when lower(gender_identity) in ('female', 'woman')
                then 'Woman'
            when lower(gender_identity) in ('male', 'man')
                then 'Man'
            when lower(gender_identity) = 'non-binary'
                then 'Non-binary or agender'
            when lower(gender_identity) = 'prefer not to say'
                then 'Not Specified'
            when gender_identity is null
                then 'Not Specified'
        end as gender_identity,

        case
            when highest_education in ('High school diploma', 'A levels')
                then 'High school diploma, GED, or A-Levels'
            when sheet_row_id = 186
                then 'Some college credit, no degree'
            when sheet_row_id = 71
                then 'Bachelor\'s Degree'
            when highest_education = 'Associate\'s Degree' or highest_education = 'Associate\'s Degree (e.g. AA, AS)'
                then 'Associate\'s Degree'
            when highest_education = 'Bachelor\'s Degree' or highest_education = 'Bachelor\'s Degree (e.g. BA, BS)'
                then 'Bachelor\'s Degree'
            when highest_education = 'Master\'s Degree' or highest_education = 'Master\’s degree (e.g. MA, MS, MEd)'
                then 'Master\'s Degree'
            when highest_education in ('JD', 'Juris Doctor') or highest_education = 'Professional Degree' or highest_education = 'Professional degree (e.g. JD, MD)'
                then 'Professional Degree'
            when highest_education = 'PhD' or highest_education = 'Doctorate' or highest_education = 'Doctorate (e.g. PhD, EdD)'
                then 'Doctorate'
            when highest_education = 'Prefer not to say'
                then 'Not specified'
            else highest_education
        end as highest_education,

        racial_identity,

        submitted_at

    from most_recent_response

)

select * from final