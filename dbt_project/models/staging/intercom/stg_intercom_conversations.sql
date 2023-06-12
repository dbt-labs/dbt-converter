{{
  config(
    materialized = 'table'
  )
}}

with 

conversations as (
    
    select * from {{ref('base__intercom_conversations')}}

),

admins as (
    
    select * from {{ ref('stg_intercom_admins') }}
    
),

teams as (

    select * from {{ ref('stg_intercom_teams') }}

),

mapped_group_names as (
    
    select * from {{ ref('stg_intercom_group_names_mapped') }}
),

joined as (
    
    select
        conversations.*,
        coalesce(admins.assignee_name,teams.assignee_name) as assignee_name,
        coalesce(admins.assignee_group,teams.assignee_group) as assignee_group
        
    from conversations   

    left join admins
        on admins.admin_id = conversations.assignee_id

    left join teams
        on teams.team_id = conversations.assignee_id

    
),

mapped as (

    select *, 
        coalesce(mapped_group_names.mapped_group_name,
            joined.assignee_group)
        as group_name
        
    from joined

    left join mapped_group_names 
    on mapped_group_names.intercom_assignee_group = joined.assignee_group

), 

final as (
--split out location information about where the ticket is being chatted from

    select 
        *,

{% set split_url = "split_part(split_part(url, '.com', 1), '://', 2)" %}

        case
            when nullif(subject, '') is not null then 'email'
            when {{split_url}} in ('cloud.getdbt', 'app.sinterdata', 'www.getdbt', 'app.intercom.io/hosted_messenger')
            or {{split_url}} is null
                then 'chat'            
            else 'Unknown'
        end as created_channel,

        case
            when {{split_url}} in ('cloud.getdbt', 'app.sinterdata')
                then 'from dbt Cloud'
            when {{split_url}} = ('www.getdbt')
                then 'from website'
            else 'not chat'
        end as chat_location

    from mapped

)

select * from final