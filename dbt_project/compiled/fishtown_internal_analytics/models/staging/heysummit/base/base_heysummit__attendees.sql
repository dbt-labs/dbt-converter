with source as (

    select * from raw.heysummit.attendees

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
        lower(nullif(

    split_part(
        

    split_part(
        http_referer,
        'utm_content=',
        2
        )

,
        '&',
        1
        )

,'')) as marketing_content,
        
    
        case 
            when len(marketing_campaign) - len(replace(marketing_campaign, '_', '')) > 1 then lower(split_part(marketing_campaign, '_', 1))
        end as marketing_campaign_period,

        case
            when len(marketing_campaign) - len(replace(marketing_campaign, '_', '')) > 1 then lower(split_part(marketing_campaign, '_', 2))
            else lower(marketing_campaign)
        end as marketing_campaign_name,

        case
            when len(marketing_campaign) - len(replace(marketing_campaign, '_', '')) > 1 then lower(split_part(marketing_campaign, '_', 3))
        end as marketing_campaign_goal,

        case
            when len(marketing_content) - len(replace(marketing_content, '_', '')) > 1 then lower(split_part(marketing_content, '_', 1))
        end as marketing_offer,

        case
            when len(marketing_content) - len(replace(marketing_content, '_', '')) > 1 then lower(split_part(marketing_content, '_', 2))
            else lower(marketing_content)
        end as marketing_asset,

        case
            when len(marketing_content) - len(replace(marketing_content, '_', '')) > 1 then lower(split_part(marketing_content, '_', 3))
        end as marketing_asset_version

,

        created_at as registered_at,
        agreed_terms as agreed_terms_at

    from source

)

select * from renamed