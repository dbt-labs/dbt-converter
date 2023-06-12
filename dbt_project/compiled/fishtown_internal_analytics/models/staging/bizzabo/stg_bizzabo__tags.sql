

with

base as (

    select * from ANALYTICS.dbt_jstein.base__bizzabo_agenda_settings

),

flattened as (

    select
        tags.value:id::integer as tag_id,
        groups.value:id::integer as group_id,
        event_id,
        tags.value:name::string as tag_name,
        groups.value:name::string as group_name,
        groups.value:type::string as group_type,
        groups.value:visible::boolean as is_group_visible

    from base,
        lateral flatten (input => filters) groups,
        lateral flatten (input => groups.value:tags) as tags

)

select * from flattened