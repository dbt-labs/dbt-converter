{{
  config(
    materialized = 'table'
  )
}}

with

talks as (

    select * from {{ ref('stg_heysummit__talks') }}

),

flattened as (

    select
        value:id::integer as speaker_id,
        talk_id,
        event_id,
        nullif(value:first_name::string,'') as first_name,
        nullif(value:last_name::string,'') as last_name,
        first_name || ' ' || last_name as full_name,
        nullif(value:company::string,'') as company_name,
        nullif(value:company_title::string,'') as company_title,
        nullif(value:bio::string,'') as bio,
        nullif(value:expert_creds::string,'') as expert_creds,
        nullif(value:headshot::string,'') as headshot_url,
        value:is_active::boolean as is_active
    
    from talks,
    lateral flatten (input => speakers)

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'speaker_id',
            'talk_id'
        ])}} as talk_speaker_id,
        *
    
    from flattened
)

select * from with_id
