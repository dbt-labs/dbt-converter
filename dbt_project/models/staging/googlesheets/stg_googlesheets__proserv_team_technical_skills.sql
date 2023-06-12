with

source as (

    select * from {{ source('fivetran_googlesheets', 'proserv_team_technical_skills') }}

),

with_id as (
    
    select
    
        {{ dbt_utils.generate_surrogate_key(['name']) }} as proserv_team_technical_skills_id,
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
