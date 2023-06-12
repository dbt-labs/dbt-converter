{{
    config(
        materialized = 'incremental',
        unique_key = 'id'
    )
}}

with pages as (

    select * from {{ ref('stg_google_search_console__pages') }}

),

with_id as (

    select
        {{dbt_utils.generate_surrogate_key([
            'site_host',
            'page_path'
        ])}} as page_id,
        *

    from pages

)

select * from with_id