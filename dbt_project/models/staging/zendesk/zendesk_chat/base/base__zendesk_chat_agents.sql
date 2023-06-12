with 

source as (
    
    select * from {{ source( 'zendesk_chat', 'chat_agent')}}

),

ordered as (

    select 
        *,
        row_number() over (partition by chat_id order by agent_id) as first_agent_selector
     from source

),

renamed as (
    
    select
        {{dbt_utils.generate_surrogate_key([
            'chat_id',
            'agent_id'
        ])}} as chat_agent_id,
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