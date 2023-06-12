


    


/* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
)

select 

    cast(null as TEXT) as unique_id,
    cast(null as TEXT) as name,
    cast(null as TEXT) as resource_type,
    cast(null as TEXT) as file_path,
    cast(True as boolean) as is_enabled,
    cast(null as TEXT) as materialized,
    cast(null as TEXT) as on_schema_change,
    cast(null as TEXT) as database,
    cast(null as TEXT) as schema,
    cast(null as TEXT) as package_name,
    cast(null as TEXT) as alias,
    cast(True as boolean) as is_described,
    cast(null as TEXT) as column_name,
    cast(null as TEXT) as meta,
    cast(null as TEXT) as hard_coded_references,
    cast(null as TEXT) as macro_dependencies,
    cast(True as boolean) as is_generic_test,
    cast(True as boolean) as is_excluded

from dummy_cte
where false