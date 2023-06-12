

{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

with 

unstruct_events as (

    select * from {{ ref('current_snowplow_unstruct_event_splitter') }}
    where 1=1
    
    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

    {% endif %}
    
    {% if is_incremental() %}

        and _loaded_at >= (select max(_loaded_at) from {{ this }})

    {% endif %}


),

job_definitions as (

    select * from {{ ref('stg_cloud__job_definitions') }}

),

field_extraction as (

    select
        'snowpipe' as _source,
        event_id,
        database_source,

        nullif(unstruct_event:user_id::string, '') as user_id,
        nullif(unstruct_event:account_id::string, '') as account_id,
        unstruct_event:job_definition_id::string as job_definition_id,

        unstruct_event:source::string as source,
        unstruct_event:user_agent::string as user_agent,

        _loaded_at,

        -- this is because we transitioned from seconds to milliseconds for 
        -- epoch tracking. This logic is here to make sure we limit the timeframe
        -- that we scan to make timestamp handling more performant as this data
        -- will continue to scale.
        case 
            when _loaded_at < '2022-05-02'
                then to_timestamp_ntz(unstruct_event:created_at_utc::integer, 0)
            when _loaded_at < '2022-05-07'
             -- this number we're using is the number of milliseconds in a year
             -- if the number is less than that, then it must be seconds (this
             -- is aligned with how snowflake auto-detects the scale today)
             and unstruct_event:created_at_utc::integer < 31536000000
                then to_timestamp_ntz(unstruct_event:created_at_utc::integer, 0)
            else to_timestamp_ntz(unstruct_event:created_at_utc::integer, 3)
        end as created_at
    
    from unstruct_events
    where event_name = 'metadata_apirequest'


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
            original_column_name = 'job_definition_id'
        ) }},

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

        source,
        user_agent,

        created_at,
        _loaded_at

    from field_extraction

),

final as (

    select
        id_hashing._source,
        id_hashing.event_id,
        id_hashing.database_source,

        coalesce(
            id_hashing.account_id,
            job_definitions.account_id
        ) as account_id,
        id_hashing.job_definition_id,
        id_hashing.user_id,

        id_hashing.source,

        -- this bucketing of sources is currently here since we don't yet have a
        -- dim/fct table for this data. Over time it will not be sustainable to 
        -- maintain this here because it will require full refreshes to update.
        -- For now it's good to stay here but once we develop these models, we 
        -- should be open to moving this bucketing downstream!
        case
            when id_hashing.source ilike '%localhost%'
                then 'local-development-testing'
            when id_hashing.source ilike '%https://au.dbt%'
                or id_hashing.source ilike '%https://emea.dbt%'
                or id_hashing.source ilike '%https://cloud.getdbt%'
                or id_hashing.source ilike '%dbt-cloud%'
                then 'cloud-app'
            when id_hashing.source ilike '%exposure-tile%'
                then 'exposure-tile'
            when id_hashing.source ilike '%metadata.%'
                or id_hashing.source ilike '%apollo%'
                then 'manual-api-call'
            else 'integration'
        end as source_buckets,

        id_hashing.user_agent,

        id_hashing.created_at,
        id_hashing._loaded_at

    from id_hashing
    left join job_definitions using (job_definition_id)

)

select * from final