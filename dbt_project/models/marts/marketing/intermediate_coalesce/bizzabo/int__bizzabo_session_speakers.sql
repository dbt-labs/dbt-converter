with

sessions as (

    select * from {{ ref('stg_bizzabo__sessions') }}
    where is_deleted = false

),

speakers as (

    select * from {{ ref('stg_bizzabo__speakers') }}
    where is_deleted = false

),

flattened as (

    select
        session_id,
        event_id,
        location_id,
        value:speakerId::integer as speaker_id
    
    from sessions,
    lateral flatten (input => speakers)

),

joined as (

    select
        flattened.*,
        speakers.email
    
    from flattened
    left join speakers using (speaker_id)

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'session_id',
            'speaker_id'
        ])}} as session_speaker_id,
        *
    
    from joined
)

select * from with_id