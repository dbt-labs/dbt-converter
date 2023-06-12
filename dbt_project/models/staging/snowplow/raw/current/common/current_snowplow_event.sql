
{{
    config(
        materialized='incremental',
        unique_key='event_id',
        cold_storage=true,
        cold_storage_date_type='relative',
        cold_storage_period=var('cold_storage_default_period'),
        cold_storage_value=var('cold_storage_default_value')
    )
}}

with

source as (

    select
        'snowpipe' as _source,
        etl_tstamp as _loaded_at,
        *

    from {{ source('snowplow', 'event') }}
    where 1=1

    {{ enhanced_incremental_filters(
        ref_timestamp='_loaded_at',
        this_timestamp='_loaded_at',
        day_overwrite=true
    )}}

    qualify row_number() over (partition by event_id order by _loaded_at desc) = 1

),

single_tenant_lookup as (

    select * from {{ ref('single_tenant_mappings') }}

),

mt_multi_region as (

    select * from {{ ref('stg_seed__mt_multiregion_mappings') }}

),

joined as (

    select

        coalesce(
            frontend.database_source,
            backend.database_source,
            mt_frontend.database_source,
            mt_backend.database_source,
            'cloud'
        ) as database_source,

        source.*
 
    from source
    left join single_tenant_lookup as backend
        on backend.mapping_field_type = 'ip_address'
        and source.user_ipaddress = backend.mapping_value
    left join single_tenant_lookup as frontend
        on frontend.mapping_field_type = 'url_host'
        and source.page_urlhost = frontend.mapping_value
    left join mt_multi_region as mt_backend
        on mt_backend.mapping_field_type = 'ip_address'
        and source.user_ipaddress = mt_backend.mapping_value
    left join mt_multi_region as mt_frontend
        on mt_frontend.mapping_field_type = 'page_urlhost'
        and source.page_urlhost = mt_frontend.mapping_value

),

user_id_correction as (

    select
        _source,
        _loaded_at,

        database_source,

        {{ id_hashing(
            original_column_name = 'user_id', 
            renamed_column_name = 'user_id_hashed'
        ) }},

        --if this isn't an actual cloud user_id,
        --then use the given user_id. otherewise, hash it
        case
            when try_to_numeric(user_id) is null
                then user_id
            else user_id_hashed
        end as user_id,


        {{ dbt_utils.star(from=source('snowplow', 'event'), except=["USER_ID"]) }}

    from joined

)

select * from user_id_correction
