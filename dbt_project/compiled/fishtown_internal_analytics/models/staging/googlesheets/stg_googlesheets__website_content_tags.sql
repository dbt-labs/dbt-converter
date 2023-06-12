with source as (

    select * from raw.fivetran_googlesheets.website_content_tags

),

renamed as (

    select
        md5(cast(coalesce(cast(page_host as TEXT), '') || '-' || coalesce(cast(page_path as TEXT), '') as TEXT)) as page_id,
        page_host,
        page_path,
        page_type,
        content_type,
        status,
        target_keyword,
        target_position,
        target_monthly_traffic,
        _fivetran_synced

    from source

)

select * from renamed