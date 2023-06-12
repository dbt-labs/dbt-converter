
    
    

with all_values as (

    select
        subtype as value_field,
        count(*) as n_records

    from raw.slack.messages
    group by subtype

)

select *
from all_values
where value_field not in (
    'bot_add','bot_message','bot_remove','channel_archive','channel_join','channel_leave','channel_name','channel_purpose','channel_topic','channel_unarchive','file_comment','me_message','pinned_item','slackbot_response','thread_broadcast','tombstone'
)


