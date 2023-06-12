


    

/* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
) 

select 
    cast(null as TEXT) as resource_id,
    cast(null as TEXT) as direct_parent_id,
    cast(True as boolean) as is_primary_relationship

from dummy_cte
where false