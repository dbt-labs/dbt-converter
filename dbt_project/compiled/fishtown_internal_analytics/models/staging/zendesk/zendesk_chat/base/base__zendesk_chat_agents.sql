with 

source as (
    
    select * from raw.fivetran_zendesk_chat.chat_agent

),

ordered as (

    select 
        *,
        row_number() over (partition by chat_id order by agent_id) as first_agent_selector
     from source

),

renamed as (
    
    select
        md5(cast(coalesce(cast(chat_id as TEXT), '') || '-' || coalesce(cast(agent_id as TEXT), '') as TEXT)) as chat_agent_id,
        chat_id,
        agent_id

    from ordered
    where first_agent_selector = 1

    -- our data model is predicated on a single agent 
    -- working a chat
    -- in the rare case there are multiple
    -- take the first and attribute all interactions to them
    -- for now as this results is the most correct
    -- interpretation of the data

)

select * from renamed