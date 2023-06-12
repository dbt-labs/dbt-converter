with

sessions as (

    select * from {{ ref('stg_bizzabo__sessions') }}
    where is_deleted = false

),

flattened as (

    select
        session_id,
        event_id,
        value::integer as sponsor_id
    
    from sessions,
    lateral flatten (input => sponsors)

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'session_id',
            'sponsor_id'
        ])}} as session_sponsor_id,
        *
    
    from flattened
)

select * from with_id