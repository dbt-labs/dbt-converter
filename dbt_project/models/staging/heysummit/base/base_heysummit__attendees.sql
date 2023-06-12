with source as (

    select * from {{ source('heysummit', 'attendees') }}

),

renamed as (

    select

        id as attendee_id,
        event_id,
        event_name,
        name,
        email,
        registration_status,
        ip_address,
        speaker_referrer_email,
        http_referer,
        http_referer_domain,
        registration_status = 'Completed Order' as is_registered,

        nullif(parse_json(replace(questions,' None',' \'\'')),'[]') as questions,
        nullif(parse_json(replace(categories,' None',' \'\'')),'[]') as categories,
        nullif(parse_json(replace(talks,' None',' \'\'')),'[]') as talks,
        nullif(parse_json(replace(tickets,' None',' \'\'')),'[]') as tickets,

        lower(utm_source) as source,
        lower(utm_medium) as medium,
        lower(replace(utm_campaign,'%20',' ')) as marketing_campaign,
        lower({{ dbt_utils.get_url_parameter(field='http_referer', url_parameter='utm_content') }}) as marketing_content,
        {{ parse_marketing_dimensions() }},

        created_at as registered_at,
        agreed_terms as agreed_terms_at

    from source

)

select * from renamed