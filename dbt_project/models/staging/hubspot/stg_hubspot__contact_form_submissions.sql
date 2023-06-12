with source as (

    select * from {{ source('hubspot', 'contact_form_submission') }}

),

renamed as (

    select
        conversion_id,
        contact_id,
        form_id,
        portal_id,
        title,
        page_url,
        parse_url(page_url):parameters:utm_medium::string as marketing_medium,
        parse_url(page_url):parameters:utm_source::string as marketing_source,
        parse_url(page_url):parameters:utm_campaign::string as marketing_campaign,
        parse_url(page_url):parameters:utm_content::string as marketing_content,
        timestamp as form_submitted_at

    from source

),

parse_marketing_dimensions as (

    select
        *,
        {{ parse_marketing_dimensions() }}

    from renamed

)

select * from parse_marketing_dimensions