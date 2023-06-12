with source as (

    select * from {{source('stripe', 'customers')}}

),

cards as (

    select
        *,
        c.value as first_card

    from source,
    lateral flatten (input => cards, outer => true) c
    where c.index = 0 or c.index is null

),

renamed as (

    select

        id as stripe_customer_id,
        created as created_at,
        coalesce(description, name) as stripe_customer_name,

        email,
        first_card,

        /*
            Billing address fields
        */
        first_card:name::string as billing_name,
        nullif(trim(first_card:address_line1::string), '') as address_line_1,
        nullif(trim(first_card:address_line2::string), '') as address_line_2,
        nullif(trim(first_card:address_city::string), '') as address_city,
        nullif(trim(first_card:address_state::string), '') as address_state,
        nullif(trim(first_card:address_zip::string), '') as address_zip,

        coalesce(
          first_card:country::string,
          first_card:address_country::string
        ) as address_country,

        concat(
            address_line_1 || '\n',
            case when address_line_2 is not null then address_line_2 || '\n' else '' end,
            concat(
                case when address_city is null then '' else address_city end,
                case when address_state is null then ' ' else ', ' || address_state end,
                case when address_zip is null then '' else ' ' || address_zip end
            )
        ) as address_string

    from cards

)

select * from renamed
