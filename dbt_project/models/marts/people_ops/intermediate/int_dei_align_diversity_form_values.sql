with

form_responses as (

    select * from {{ ref('stg_googlesheets__diversity_form_responses') }}

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
        form_responses.* exclude racial_identity,
        coalesce(
            dei_ethnicity_values.category_value_dei,
            form_responses.racial_identity
        ) as dei_ethnicity_and_race,
        coalesce(
            eeo_race_values.category_value_eeo,
            form_responses.racial_identity
        ) as eeo_racial_identity

    from form_responses
    left join dei_ethnicity_values
        -- Using lower() for join integrity, but we want the capitalization retained in the values
        on lower(form_responses.racial_identity) = lower(dei_ethnicity_values.form_response)
    left join eeo_race_values
        on lower(form_responses.racial_identity) = lower(eeo_race_values.form_response)

)

select * from final