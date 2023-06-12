{{
    config(
        materialized = 'incremental',
        unique_key = 'id'
    )
}}

with keywords as (

    select * from {{ ref('stg_google_search_console__keywords') }}

),

with_id as (

    select
        {{dbt_utils.generate_surrogate_key([
            'site_host',
            'page_path'
        ])}} as page_id,
        *

    from keywords

)

select * from with_id