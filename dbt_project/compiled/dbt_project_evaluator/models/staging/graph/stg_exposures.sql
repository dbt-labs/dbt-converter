


    

/* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
)

select 

    cast(null as TEXT ) as unique_id,
    cast(null as TEXT ) as name,
    cast(null as TEXT ) as resource_type,
    cast(null as TEXT ) as file_path,
    cast(True as boolean) as is_described,
    cast(null as TEXT ) as exposure_type,
    cast(null as TEXT ) as maturity,
    cast(null as TEXT ) as package_name,
    cast(null as TEXT ) as url,
    cast(null as TEXT ) as owner_name,
    cast(null as TEXT ) as owner_email,
    cast(null as TEXT ) as meta

from dummy_cte
where false