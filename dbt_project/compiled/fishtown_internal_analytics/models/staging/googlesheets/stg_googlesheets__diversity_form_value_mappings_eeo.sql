with

source as (

    select * from raw.fivetran_googlesheets.diversity_form_value_mappings_eeo

),

renamed as (

    select
        identity_category,
        case
            when identity_category = 'Race' and value is null
                then 'Hispanic or Latino'
            else value
        end as category_value_eeo,
        responses as form_response

    from source

)

select * from renamed