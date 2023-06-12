with

source as (

    select * from {{ source('adp', 'person_history') }}
    -- Most recently synced record
    qualify row_number() over (partition by worker_id order by _fivetran_synced desc) = 1

),

renamed as (

    select distinct
        worker_id,
        
        preferred_name_given_name as preferred_first_name,
        preferred_name_family_name_1 as preferred_last_name,
        preferred_name_given_name || ' ' || preferred_name_family_name_1 as preferred_name,

        legal_name_given_name as legal_first_name,
        legal_name_family_name_1 as legal_last_name,
        legal_name_given_name || ' ' || legal_name_family_name_1 as legal_name,

        legal_address_country_code,
        legal_address_postal_code,
        legal_address_country_subdivision_level_1,

        case
            when gender_short_name = 'Female'
                then 'Woman'
            when gender_short_name = 'Male'
                then 'Man'
            else gender_short_name
        end as gender_identity,
        
        ethnicity_long_name as ethnicity,
        race_short_name as racial_identity,

        datediff(year, birth_date, current_date()) as age,
        case
            when age >= 18 and age < 25
                then '18 to 24'
            when age >= 25 and age < 35
                then '25 to 34'
            when age >= 35 and age < 45
                then '35 to 44'
            when age >= 45 and age < 55
                then '45 to 54'
            when age >= 55 and age < 65
                then '55 to 64'
            when age >= 65
                then '65+'
        end as age_bucket,

        death_date

    from source

),

final as (

    select * exclude age
    from renamed

)

select * from final
