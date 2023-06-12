with source as (

    select * from raw.fivetran_google_search_console.keyword_page_report

),

renamed as (

    select
        md5(cast(coalesce(cast(date as TEXT), '') || '-' || coalesce(cast(country as TEXT), '') || '-' || coalesce(cast(device as TEXT), '') || '-' || coalesce(cast(keyword as TEXT), '') || '-' || coalesce(cast(page as TEXT), '') || '-' || coalesce(cast(search_type as TEXT), '') || '-' || coalesce(cast(site as TEXT), '') as TEXT)) as id,
        date,
        upper(country) as country,
        device,
        keyword,
        page,
        '/' || parse_url(page):path::varchar as page_path,
        search_type,
        site,
        parse_url(site):host::varchar as site_host,
        clicks,
        impressions,
        ctr,
        position,
        _fivetran_synced

    from source

)

select * from renamed