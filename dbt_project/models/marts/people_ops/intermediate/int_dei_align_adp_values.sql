with 

adp_person as (
    select     
        worker_id,
        gender_identity,
        ethnicity,
        racial_identity,
        age_bucket
    
    -- this isn't actually their history - it filters to the most recent record only.
    from {{ ref('stg_adp__person_history') }}
),

dei_ethnicity_values as (

    select * from {{ ref('stg_googlesheets__diversity_form_value_mappings_dei') }}
    where identity_category = 'Race and Ethnicity'

),

eeo_race_values as (

    select * from {{ ref('stg_googlesheets__diversity_form_value_mappings_eeo') }}
    where identity_category = 'Race'

),

final as (

    select
        adp_person.* exclude racial_identity,
        coalesce(
            dei_ethnicity_values.category_value_dei,
            adp_person.racial_identity
        ) as dei_ethnicity_and_race,
        coalesce(
            eeo_race_values.category_value_eeo,
            adp_person.racial_identity
        ) as eeo_racial_identity

    from adp_person
    left join dei_ethnicity_values
        -- Using lower() for join integrity, but we want the capitalization retained in the values
        on lower(adp_person.racial_identity) = lower(dei_ethnicity_values.form_response)
    left join eeo_race_values
        on lower(adp_person.racial_identity) = lower(eeo_race_values.form_response)

)

select * from final