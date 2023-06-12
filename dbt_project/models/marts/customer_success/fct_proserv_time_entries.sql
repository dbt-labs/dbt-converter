with 

time_entries as ( 

  select * from {{ ref('stg_harvest__time_entries') }}  
), 

services_projects as (

   select * from {{ ref('dim_services_projects') }}
), 

tasks as (

  select * from  {{ ref('stg_harvest__tasks') }}
  
),

users as (

  select * from  {{ ref('stg_harvest__users') }}
  
),

joined as (

    select 
    
        {{ dbt_utils.star(from=ref('stg_harvest__time_entries'), except=[
            'IS_LOCKED',
            'LOCKED_REASON', 
            'NOTES',
            'RUNNING'
        ],relation_alias='time_entries') }},
        
        services_projects.project_name,
        services_projects.salesforce_opportunity_line_item_id,
        services_projects.project_starts_on, 
        services_projects.project_ends_on, 
        
        services_projects.client_name,
        services_projects.salesforce_account_id,
        
        tasks.task_name, 
        
        users.user_name,
        users.user_full_name
        
    from time_entries
    left join services_projects on time_entries.project_id = services_projects.project_id
    left join tasks on time_entries.task_id = tasks.task_id
    left join users on time_entries.user_id = users.user_id
  
)
  
select * from joined 


