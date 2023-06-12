{{
  config(
    materialized = 'table'
  )
}}

with

source as (

    select * from {{ source('fivetran_googlesheets', 'pro_serv_feature_enablement_sessions') }}

),

renamed as (

    select
        _row as enablement_session_id,
        feature as feature_name,
        is_enabled,
        expected_release,
        
        enablement_session_date::date as enablement_session_date

    from source

)

select * from renamed