{{
  config(
    materialized = 'table'
  )
}}

with

conversation_parts as (
    
    select * from {{ref('base__intercom_conversation_parts')}}
    
),

flattened as (

    select      

        conversation_parts.*,
        parts.value['PART_TYPE']::varchar as part_type,
        parts.value['AUTHOR']['type']::varchar as author_type,
        parts.value['AUTHOR']['id']::varchar as user_id,
        parts.value['BODY']::varchar as body,
        convert_timezone('America/New_York', 
            trim(parts.value['CREATED_AT'],'"'))::timestamp_ntz 
            as created_at,
        convert_timezone('America/New_York', 
            trim(parts.value['CONVERSATION_CREATED_AT'],'"'))::timestamp_ntz 
            as conversation_created_at
    from conversation_parts,
    lateral flatten (input => conversation_parts) parts
        
),

message_count as (

    select 
        *,
        
        row_number() over (partition by ticket_id 
            order by created_at) as ticket_comment_number

    from flattened
    
),

final as (
    
    select
        {{  dbt_utils.generate_surrogate_key(['ticket_id','ticket_comment_number']) }} 
            as ticket_comment_id,
        *,
        case
            when author_type = 'user' then 'end-user'
            else author_type
        end as role,
        case
            when part_type != 'note'
              and body is not null 
              then true
            else false
        end as is_public
    from message_count
    
)

select * from final

