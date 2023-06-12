with

source as (

    select
    {{ dbt_utils.star(
        from=source('fivetran_googlesheets', 'proserv_utilization_targets'), 
        except=["individual_utilization_percent"]) }}

    from {{ source('fivetran_googlesheets', 'proserv_utilization_targets') }}

),

with_id as (
    
    select
    
        {{ dbt_utils.generate_surrogate_key(['name', 'week_start']) }} as proserv_utilization_targets_id,
        *,
        lead(week_start,1) 
            over(partition by name order by week_start::date rows between unbounded preceding and unbounded following)
            as following_week
        
    from source
    
)

select * from with_id
