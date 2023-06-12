


    


/* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
)

select 

    cast(null as TEXT) as unique_id,
    cast(null as TEXT) as name,
    cast(null as TEXT) as file_path,
    cast(null as TEXT) as alias,
    cast(null as TEXT) as resource_type,
    cast(null as TEXT) as source_name,
    cast(True as boolean) as is_source_described,
    cast(True as boolean) as is_described,
    cast(True as boolean) as is_enabled,
    cast(null as TEXT) as loaded_at_field,
    cast(null as TEXT) as database,
    cast(null as TEXT) as schema,
    cast(null as TEXT) as package_name,
    cast(null as TEXT) as loader,
    cast(null as TEXT) as identifier,
    cast(null as TEXT)  as meta,
    cast(True as boolean) as is_excluded

from dummy_cte
where false