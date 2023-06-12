
    
    

with all_values as (

    select
        git_provider as value_field,
        count(*) as n_records

    from analytics_dev.dbt_jstein.stg_cloud__repos
    group by git_provider

)

select *
from all_values
where value_field not in (
    'Other','GitHub','Bitbucket','GitLab','CodeCommit','Visual Studio','Azure'
)


