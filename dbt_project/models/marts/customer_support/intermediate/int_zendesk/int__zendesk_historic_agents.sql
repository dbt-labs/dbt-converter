with 

historic_agents as (
    select distinct value as user_id
    from {{ ref('stg_zendesk__ticket_field_history') }}
    where field_name = 'assignee_id'
),

final as (
    -- Users who are no longer agents in Zendesk are marked as end-users
    -- This retroactively marks their actions as end-user causing a potential
    -- miscalculated SLA miss if they are the only respondent
    -- 
    -- By examining all users who have been assignees we can reasonably conclude 
    -- a user was an agent at some point and attribute their actions accordingly.

    select users.user_id,
      users.name
    from {{ ref('stg_zendesk__user') }} users 
    
    inner join historic_agents 
    on users.user_id = historic_agents.user_id
)

select * 
from final
