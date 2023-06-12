with 

chat_history as (
    
    select * from {{ ref( 'base__zendesk_chat_history') }}

),

chat as (
    
    select * from {{ ref( 'stg_zendesk__chat') }}

),

chat_agents as (
    
    select * from {{ ref( 'stg_zendesk__chat_agents') }}

),

tickets as (
    
    select * from {{ ref( 'stg_zendesk__ticket') }}

),

region_lookup as (
    
    select * from {{ ref( 'country_to_region_mappings') }}

),

unique_regions as (

    select distinct
        country_code,
        region_category
    
    from region_lookup

),

joined as (

    select
        chat_history.*,
        chat.ticket_id,
        coalesce(
            chat_agents.agent_id,
            tickets.requester_id
        ) as user_id,
        chat.country_code,
        chat.country_name,
        unique_regions.region_category

    from chat_history
    left join chat using (chat_id)
    left join tickets using (ticket_id)
    left join unique_regions using (country_code)
    left join chat_agents
        on chat_history.chat_id = chat_agents.chat_id
        -- and chat_history.user_name = chat_agents.user_name
        and not chat_history.is_requestor

        -- This join will not properly handle cases where
        -- there are multiple agents in a single chat
        -- As of Jun 5, 2022 that was 11 of 6650 chats (<0.17%)
        -- The tradeoff is not maching the agent name properly
        -- if the agent changes their display name in 
        -- Zendesk which is far more commmon

        -- This is because Zendesk logs user_name in the chat
        -- log with the username at the time of the chat
        -- instead of logging the user id, making matching
        -- with 100% accuracy impossible

)

select * from joined
