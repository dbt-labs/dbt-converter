





with validation_errors as (

    select
        version_tag, id
    from analytics_dev.dbt_jstein.base_linkedin_ads__creative_history
    group by version_tag, id
    having count(*) > 1

)

select *
from validation_errors


