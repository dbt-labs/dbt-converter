with source as (

    select * from {{ source('google_search_console', 'page_report') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key([
            'date',
            'country',
            'device',
            'page',
            'search_type',
            'site'
        ])}} as id,
        date,
        upper(country) as country,
        device,
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