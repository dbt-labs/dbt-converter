
    
    

with all_values as (

    select
        subtype as value_field,
        count(*) as n_records

    from raw.slack_historical.messages
    group by subtype

)

select *
from all_values
where value_field not in (
    'bot_add','bot_message','channel_archive','channel_join','channel_leave','channel_name','channel_purpose','channel_topic','file_comment','me_message','pinned_item','thread_broadcast','tombstone'
)


