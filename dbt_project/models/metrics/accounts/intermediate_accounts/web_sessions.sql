with

pageviews as (

    select * from {{ ref('fct_web_pageviews') }}
    where app_id in ('getdbt.com','docs.getdbt.com','blog.getdbt.com')
        and is_internal_user = False

),

sessions as (

    select * from {{ ref('fct_web_sessions') }}

),

joined as (

    select
        pageviews.* exclude (channel, sub_channel, marketing_campaign),

        coalesce(
            sessions.channel,
            'No Channel'
        ) as channel,

        coalesce(
            sessions.sub_channel,
            'No Sub-Channel'
        ) as sub_channel,

        coalesce(
            sessions.region_category,
            'No Region'
        ) as region_category,

        coalesce(
            sessions.sales_territory,
            'No Territory'
        ) as sales_territory,

        coalesce(
            sessions.market_segment,
            'No Market Segment'
        ) as market_segment,

        coalesce(
            sessions.marketing_campaign,
            'No Marketing Campaign'
        ) as marketing_campaign,

        sessions.session_start
    
    from pageviews
    inner join sessions
        on pageviews.session_id = sessions.session_id

)

select * from joined