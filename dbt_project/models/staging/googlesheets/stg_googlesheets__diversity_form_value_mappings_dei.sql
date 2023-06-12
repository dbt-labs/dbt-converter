with

source as (

    select * from {{ source('fivetran_googlesheets', 'diversity_form_value_mappings_dei') }}

),

renamed as (

    select
        identity_category,
        parent_group as category_value_dei,
        subgroup as subcategory_value_dei,
        responses as form_response

    from source

)

select * from renamed