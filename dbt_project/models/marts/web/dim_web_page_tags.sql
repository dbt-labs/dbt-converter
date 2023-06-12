with pageviews as (

    select * from {{ ref('int_snowplow_page_views') }}
    where page_url_host in ('www.getdbt.com','docs.getdbt.com','blog.getdbt.com')

),

content_tags as (

    select * from {{ ref('stg_googlesheets__website_content_tags') }}

),

distinct_pages as (

    select distinct
        {{dbt_utils.generate_surrogate_key([
            'page_url_host',
            'page_url_path'
        ])}} as page_id,
        page_url_host,
        page_url_path,
        page_url_host || page_url_path as page_url

    from pageviews
),

joined as (

    select
        distinct_pages.page_id,
        distinct_pages.page_url_host,
        distinct_pages.page_url_path,
        distinct_pages.page_url,
        content_tags.page_type,
        content_tags.content_type,
        content_tags.status, 
        content_tags.target_keyword,
        content_tags.target_position,
        content_tags.target_monthly_traffic,
        content_tags.target_keyword is not null as is_target_page

    from distinct_pages
    left join content_tags
        using (page_id)

)

select * from joined