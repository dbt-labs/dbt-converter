with 

base as ( 

  select * from {{ ref('stg_googlesheets__proserv_team_technical_skills') }}  

)

select * from base