{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

with 

unstruct_events as (
    select * from {{ ref('current_snowplow_unstruct_event_splitter') }}
    
    -- When this feature was released
    where collector_tstamp >= '2022-08-17'
        and event_name = 'dbt_cloud_api_request'

    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)
    
    {% endif %}

    {% if is_incremental() %}
    
        and _loaded_at >= (select max(_loaded_at) from {{ this }})
    
    {% endif %}
),

field_extraction as (
    
    select
        'snowpipe' as _source,
        event_id,
        database_source,

        nullif(unstruct_event:user_id::varchar, '') as user_id,
        nullif(unstruct_event:account_id::varchar, '') as account_id,
        nullif(unstruct_event:method::varchar, '') as method,
        nullif(unstruct_event:path::varchar, '') as path,
        unstruct_event:query_params::object as query_params,
        nullif(unstruct_event:user_agent::varchar, '') as user_agent,
        nullif(unstruct_event:api_version::varchar, '') as api_version,
        nullif(unstruct_event:auth_type::varchar, '') as auth_type,
        
        collector_tstamp,
        _loaded_at,
        nullifzero(unstruct_event:request_at_utc::number) as _request_at_utc,
        to_timestamp_ntz(_request_at_utc, 3) as request_at
    
    from unstruct_events

),

id_hashing as (

    select
        _source,
        event_id,
        database_source,

        {{ id_hashing(
            original_column_name = 'account_id',
            renamed_column_name = 'account_id_hashed'
        ) }},

        --if this isn't an actual cloud account_id,
        --then keep it null. otherewise, hash it
        case
            when account_id is null
                then account_id
            else account_id_hashed
        end as account_id,

        {{ id_hashing(
            original_column_name = 'user_id',
            renamed_column_name = 'user_id_hashed'
        ) }},

        --if this isn't an actual cloud user_id,
        --then keep it null. otherewise, hash it
        case
            when user_id is null
                then user_id
            else user_id_hashed
        end as user_id,

        method,
        path,
        query_params,
        user_agent,
        api_version,
        auth_type,

        collector_tstamp,
        _loaded_at,
        request_at

    from field_extraction

),

final as (

    select
        _source,
        event_id,
        database_source,

        account_id,
        user_id,
        tenant_account_id_hashed as tenant_account_id,
        tenant_user_id_hashed as tenant_user_id,

        method,
        path,
        query_params,
        user_agent,
        api_version,
        auth_type,

        collector_tstamp,
        _loaded_at,
        request_at,

        -- Extracted query params
        case
            when query_params:limit is not null
                and query_params:offset is not null
                    then true
            else false
        end as has_query_pagination,

        -- casting these next two fields to varchar instead of integer due to some non-integer values (broke in prod)
        query_params:limit::varchar as query_param_limit,
        query_params:offset::varchar as query_param_offset,
        strtok_to_array(regexp_replace(query_params:include_related::varchar, '[^a-zA-Z,_]+'), ',') as query_param_include_related,
        query_params:order_by::varchar as query_param_order_by

    from id_hashing

)

select * from final