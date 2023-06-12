{{
  config(
    materialized = 'table'
  )
}}

with

source as (

    select * from {{ source('google_search_console', 'site_report_by_site') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'date',
            'country',
            'device',
            'search_type',
            'site'
        ])}} as id,
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