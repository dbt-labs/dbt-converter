--depends_on: raw.fivetran_linkedin_organic.organization

    select 
        cast(null as TEXT) as _dbt_source_relation
    limit 0