{{
  config(
    materialized = "view"
  )
}}

with submissions as (

    select * from {{ ref('stg_hubspot__contact_form_submissions') }}

),

forms as (

    select * from {{ ref('stg_hubspot__forms') }}

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key(['marketing_campaign']) }} as campaign_id,
        forms.snowplow_form_id,
        submissions.*
    
    from submissions
    left join forms using (form_id)

)

select * from with_id
