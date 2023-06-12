with

base as (

    select * from {{ ref('base__bizzabo_agenda_settings') }}

),

flattened as (

    select
        sublocations.value:id::integer as sublocation_id,
        locations.value:id::integer as location_id,
        event_id,
        sublocations.value:name::string as sublocation_name,
        locations.value:name::string as location_name

    from base,
        lateral flatten (input => locations, outer => true) locations,
        lateral flatten (input => locations.value:sublocations, outer => true) sublocations

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'location_id',
            'sublocation_id'
        ])}} as location_lookup_id,
        *
    
    from flattened

)

select * from with_id