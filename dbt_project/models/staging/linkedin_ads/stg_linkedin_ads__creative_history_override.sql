{{ 
    config(
        enabled=var('ad_reporting__linkedin_ads_enabled', True)
    ) 
}}

with

base as (

    select * from {{ ref('stg_linkedin_ads__creative_history_tmp') }}

),

fields as (

    select
        id as creative_id,
        campaign_id,
        share_id,
        coalesce(intended_status, status) as status,
        click_uri,
        cast(coalesce(last_modified_at, last_modified_time) as {{ dbt.type_timestamp() }}) as last_modified_at,
        cast(coalesce(created_at, created_time) as {{ dbt.type_timestamp() }}) as created_at,
        row_number() over (partition by id order by coalesce(last_modified_at, last_modified_time) desc) = 1 as is_latest_version

    from base

),

url_fields as (

    select 
        *,
        {{ dbt.split_part('click_uri', "'?'", 1) }} as base_url,
        {{ dbt_utils.get_url_host('click_uri') }} as url_host,
        '/' || {{ dbt_utils.get_url_path('click_uri') }} as url_path,
        {{ dbt_utils.get_url_parameter('click_uri', 'utm_source') }} as utm_source,
        {{ dbt_utils.get_url_parameter('click_uri', 'utm_medium') }} as utm_medium,
        {{ dbt_utils.get_url_parameter('click_uri', 'utm_campaign') }} as utm_campaign,
        {{ dbt_utils.get_url_parameter('click_uri', 'utm_content') }} as utm_content,
        {{ dbt_utils.get_url_parameter('click_uri', 'utm_term') }} as utm_term
    
    from fields

)

select * from url_fields

