with

unioned as (


    {{ dbt_utils.union_relations(
        relations=[ref('int__intercom_tickets_enriched'), 
                   ref('int__zendesk_tickets_joined')],
                   exclude=["_FIVETRAN_SYNCED",
                            "IS_READ",
                            "MAPPED_GROUP_NAMES",
                            "INTERCOM_ASSIGNEE_GROUP",
                            "ASSIGNEE_GROUP",
                            "TAGS",
                            "CONVERSATION_RATING",
                            "SOURCE_FROM_ID",
                            "SOURCE_FROM_TITLE",
                            "SOURCE_TO_ADDRESS",
                            "SOURCE_TO_NAME",
                            "TICKET_FORM_ID",
                            "PROBLEM_ID",
                            "SNOOZED_UNTIL",
                            "WAITING_SINCE",
                            "BRAND_ID",
                            "DESCRIPTION"]
    ) }}


)

select * from unioned

