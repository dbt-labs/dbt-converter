with 

chat_agent as (

    select * from {{ ref( 'base__zendesk_chat_agents')}}

),

users as (
    
    select * from {{ ref( 'stg_zendesk__user')}}

),

joined as (
    
    select

        chat_agent.*,
        users.name as agent_name

    from chat_agent
    left join users
        on chat_agent.agent_id = users.user_id

)

select * from joined