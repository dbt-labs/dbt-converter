{{
    config(
        materialized='incremental',
        unique_key='user_snowplow_domain_id'
    )
}}


with

page_views as (

    select * from {{ ref('fct_web_pageviews') }}

    {% if is_incremental() %}

    where max_tstamp >= (select max(max_tstamp) from {{ this }})

    {% endif %}

),

final as (

    select
        user_snowplow_domain_id,
        inferred_user_id,
        max_tstamp
    
    from page_views
    qualify row_number() over (
        partition by user_snowplow_domain_id
        order by max_tstamp desc
    ) = 1

)

select * from final