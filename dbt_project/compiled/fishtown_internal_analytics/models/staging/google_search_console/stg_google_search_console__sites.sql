

with

source as (

    select * from raw.fivetran_google_search_console.site_report_by_site

),

renamed as (

    select
        md5(cast(coalesce(cast(date as TEXT), '') || '-' || coalesce(cast(country as TEXT), '') || '-' || coalesce(cast(device as TEXT), '') || '-' || coalesce(cast(search_type as TEXT), '') || '-' || coalesce(cast(site as TEXT), '') as TEXT)) as id,
        date,
        upper(country) as country,
        device,
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