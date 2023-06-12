with

source as (

    select * from raw.fivetran_googlesheets.proserv_team_technical_skills

),

with_id as (
    
    select
    
        md5(cast(coalesce(cast(name as TEXT), '') as TEXT)) as proserv_team_technical_skills_id,
        name,
        
        dbt,
        
        -- warehouses
        snowflake,	
        databricks,	
        bigquery,		
        redshift,	
        
        -- BI
        hex,	
        looker,
        
        -- other
        airflow
                
    from source
    
)

select * from with_id