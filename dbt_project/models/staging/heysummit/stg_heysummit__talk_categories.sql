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
        value:id::integer as category_id,
        talk_id,
        event_id,
        nullif(value:title::string,'') as title,
        nullif(value:description::string,'') as description
    
    from talks,
    lateral flatten (input => categories)

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'category_id',
            'talk_id'
        ])}} as talk_category_id,
        *
    
    from flattened
)

select * from with_id