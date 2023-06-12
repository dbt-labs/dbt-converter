with

creative_history as (

    select * from {{ ref('stg_linkedin_ads__creative_history_override' ) }}
    where is_latest_version

),

share_history as (

    select * from {{ ref('stg_linkedin_pages__shares') }}

),

creative_history_enriched as (

    select
        creative_history.creative_id,
        share_history.landing_page_url,

        {{ dbt.split_part('share_history.landing_page_url', "'?'", 1) }} as base_url,
        {{ dbt_utils.get_url_host('share_history.landing_page_url') }} as url_host,
        '/' || {{ dbt_utils.get_url_path('share_history.landing_page_url') }} as url_path,
        {{ dbt_utils.get_url_parameter('share_history.landing_page_url', 'utm_source') }} as utm_source,
        {{ dbt_utils.get_url_parameter('share_history.landing_page_url', 'utm_medium') }} as utm_medium,
        {{ dbt_utils.get_url_parameter('share_history.landing_page_url', 'utm_campaign') }} as utm_campaign,
        {{ dbt_utils.get_url_parameter('share_history.landing_page_url', 'utm_content') }} as utm_content,
        {{ dbt_utils.get_url_parameter('share_history.landing_page_url', 'utm_term') }} as utm_term

    from creative_history
    inner join share_history
        on creative_history.share_id = share_history.share_id

),

joined as (

    select
        {{ dbt_utils.star(
            from = ref('stg_linkedin_ads__creative_history_override'),
            except = [
                'click_uri',
                'base_url',
                'url_host',
                'url_path',
                'utm_source',
                'utm_medium',
                'utm_campaign',
                'utm_content',
                'utm_term'
            ],
            relation_alias = 'creative_history'
        ) }},
        coalesce(creative_history.click_uri, creative_history_enriched.landing_page_url) as click_uri,
        coalesce(creative_history.base_url, creative_history_enriched.base_url) as base_url,
        coalesce(creative_history.url_host, creative_history_enriched.url_host) as url_host,
        coalesce(creative_history.url_path, creative_history_enriched.url_path) as url_path,
        coalesce(creative_history.utm_source, creative_history_enriched.utm_source) as utm_source,
        coalesce(creative_history.utm_medium, creative_history_enriched.utm_medium) as utm_medium,
        coalesce(creative_history.utm_campaign, creative_history_enriched.utm_campaign) as utm_campaign,
        coalesce(creative_history.utm_content, creative_history_enriched.utm_content) as utm_content,
        coalesce(creative_history.utm_term, creative_history_enriched.utm_term) as utm_term


    from creative_history
    left join creative_history_enriched
        on creative_history.creative_id = creative_history_enriched.creative_id

)

select * from joined