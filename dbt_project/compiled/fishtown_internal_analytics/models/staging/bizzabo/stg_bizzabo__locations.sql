with

base as (

    select * from ANALYTICS.dbt_jstein.base__bizzabo_agenda_settings

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
        
    
md5(cast(coalesce(cast(location_id as TEXT), '') || '-' || coalesce(cast(sublocation_id as TEXT), '') as TEXT)) as location_lookup_id,
        *
    
    from flattened

)

select * from with_id