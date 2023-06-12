with

unioned as (

    {{ dbt_utils.union_relations(
        relations=[ref('stg_intercom_conversation_parts'), 
                   ref('int__zendesk_ticket_events_windowed')],
                   exclude=["CONVERSATION_PARTS",
                            "TICKET_COMMENT_ROLE_NUMBER",
                            "EVENT_TYPE",
                            "AUTHOR_TYPE"]
    ) }}

)

select * from unioned