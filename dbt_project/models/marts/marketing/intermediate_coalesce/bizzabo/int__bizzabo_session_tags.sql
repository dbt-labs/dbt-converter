with

sessions as (

    select * from {{ ref('stg_bizzabo__sessions') }}
    where is_deleted = false

),

session_tags as (

    select
        session_id,
        tags.value::integer as tag_id
        

    from sessions,
        lateral flatten (input => filters) filters,
        lateral flatten (input => filters.value:tags) as tags

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'session_id',
            'tag_id'
        ])}} as session_tag_id,
        *
    
    from session_tags

)

select * from with_id