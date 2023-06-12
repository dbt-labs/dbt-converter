with source as (

    select * from {{ source('fivetran_googlesheets', 'website_content_tags') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key([
            'page_host',
            'page_path'
        ])}} as page_id,
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