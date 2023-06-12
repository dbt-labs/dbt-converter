{#
    The `enabled` argument removes this model from our project and 
    should not be considered part of the example.
#}
{{
    config(
        enabled=false
    )
}}

with

source as (

    select * from {{ source('data_masking_example', 'fake_pii_sample') }}

),

final as (

    select
        email as masked_email,
        street as masked_street,

        name as unmasked_name,
        state as unmasked_state,
        zipcode as unmasked_zipcode,
        city as unmasked_city

    from source

)

select * from final