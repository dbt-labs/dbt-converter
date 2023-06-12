with

source as (

    select
    
*
/* No columns were returned. Maybe the relation doesn't exist yet 
or all columns were excluded. This star is only output during  
dbt compile, and exists to keep SQLFluff happy. */
            

    from raw.fivetran_googlesheets.proserv_utilization_targets

),

with_id as (
    
    select
    
        md5(cast(coalesce(cast(name as TEXT), '') || '-' || coalesce(cast(week_start as TEXT), '') as TEXT)) as proserv_utilization_targets_id,
        *,
        lead(week_start,1) 
            over(partition by name order by week_start::date rows between unbounded preceding and unbounded following)
            as following_week
        
    from source
    
)

select * from with_id