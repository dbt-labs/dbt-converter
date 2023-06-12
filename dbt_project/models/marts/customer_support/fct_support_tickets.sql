with

tickets as (

    select * from {{ ref('support_tickets_unioned') }}

),

message_details as (

    select * from {{ref('int__support_message_details')}}

),

tags as (

    select * from {{ ref('int__support_all_ticket_tags') }}

),

cloud_users as (

    select * from {{ ref('fct_cloud_users') }}

),

accounts as (

    select * from {{ ref('stg_cloud__accounts') }}

),

entitlements as (

    select * from {{ ref('fct_support_max_entitlements' ) }}

),

max_entitlements as (

    select max(date_day) as date_day from entitlements

),

message_overview as (

    select * from message_details
    where ticket_comment_number = 1

),

cloud_users_agg as (

    select
        email,
        convert_timezone(
                'America/New_York',
                min(date_joined__ntz)
        ) as first_date_joined
    
    from cloud_users
    /*
    aggregating to the email level because we want to know when a user
    first joined (regardless of the account or their cloud user id) 
    */

    group by 1

),

/* The below CTEs are used to list all distinct assignees and to
list all escalation events (e.g. CS -> Eng -> CS) ordered by
the event timestamp */

assignee_events as (

    select 
        ticket_id,
        assignee_name,
        min(created_at) as first_message_sent_at
        
    from message_details
    where assignee_name is not null
    group by 1,2

),

link_events as (
    
    select 
        ticket_id,
        link_to_docs_or_issue,
        min(created_at) as first_message_sent_at
        
    from message_details
    where link_to_docs_or_issue is not null
    group by 1,2
    
),

escalation_events as (

    select
        ticket_id,
        created_at,
        group_name,
        lag(group_name) over (
            partition by ticket_id
            order by created_at
        ) as previous_group

    from message_details
    qualify group_name != previous_group or previous_group is null
    --only pick the moments the ticket escalated or de-escalated

),

all_assignees as (

    select
        ticket_id,
        listagg(assignee_name, ', ') within group (
            order by first_message_sent_at
        ) as all_assignees

    from assignee_events
    group by 1

),

all_links as (

    select
        ticket_id,
        listagg(link_to_docs_or_issue, ', ') within group (
            order by first_message_sent_at
        ) as all_links

    from link_events
    group by 1

),

all_escalations as (

    select 
        ticket_id,
        listagg(distinct group_name, ', ') within group (
            order by group_name
        ) as all_escalation_groups 

    from escalation_events
    group by 1

),

joined as (

    select

        case
            when tickets._dbt_source_relation ilike '%intercom%' then 'intercom'
            when tickets._dbt_source_relation ilike '%zendesk%' then 'zendesk'
        end as source,

        {{ dbt_utils.star(from=ref('support_tickets_unioned'),
            relation_alias='tickets',
            except=[
                "_DBT_SOURCE_RELATION",
                "SOURCE_REL",
                "VIA_FOLLOWUP_TICKET_ID"
        ]) }},

        -- SUBMITTER INFO
        cloud_users_agg.first_date_joined as submitter_date_joined,
        

        -- ACCOUNT INFO
        accounts.created_at as cloud_account_created_at,

        --GEO INFO
        message_overview.country_code,
        message_overview.country_name,
        message_overview.region_category,

        --Ticket Info
        tags.is_enterprise_tagged,
        (
            tags.is_tier_two_support 
            or all_escalation_groups ilike '%engineering%'
        ) as is_tier_two_support,
        tags.is_automated,
        (
            tags.is_setup_related 
            and tickets.source_rel is null 
            and tickets.created_channel = 'api'
        ) as is_setup,
        (
            tags.is_setup_land_related 
            and tickets.source_rel is null 
            and tickets.created_channel = 'api'
        ) as is_setup_land,
        tickets.source_rel = 'follow_up' as is_follow_up,
        (
            coalesce(tickets.requester_email,tickets.submitter_email) ilike '%dbtlabs.com%'
            or coalesce(tickets.requester_email,tickets.submitter_email) ilike '%fishtownanalytics.com%'
        ) as is_internal_user,
        (
            tickets.submitter_email ilike '%dbtlabs.com%'
            or tickets.submitter_email ilike '%fishtownanalytics.com%'
        ) as is_internal_submission,
        (
            tickets.source_rel = 'follow_up' 
            and tickets.created_channel = 'web' 
            and cast(tickets.submitter_id as varchar) = cast(tickets.assignee_id as varchar)

        ) as is_follow_up_exclusion,
        tags.is_merged,
        tags.is_proactive,
        tags.all_ticket_tags,
        all_assignees.all_assignees,
        all_links.all_links,
        all_escalations.all_escalation_groups,

        --Timestamps
        message_overview.first_closed_at,
        message_overview.first_closed_at_business,
        message_overview.last_closed_at,
        message_overview.last_closed_at_business,
        message_overview.first_message_at,
        message_overview.first_message_at_business,
        message_overview.first_response_at,
        message_overview.first_response_at_business,
        message_overview.last_customer_response_at,
        message_overview.last_customer_response_at_business,
        message_overview.last_agent_response_at,
        message_overview.last_agent_response_at_business,
        message_overview.last_response_at,
        message_overview.last_response_at_business,
        message_overview.last_responder,
        
        datediff(
            day, 
            cloud_users_agg.first_date_joined,
            tickets.created_at
        ) as days_submitter_date_joined_to_ticket_created,
        
        datediff(
            day, 
            cloud_users_agg.first_date_joined,
            message_overview.first_closed_at
        ) as days_submitter_date_joined_to_ticket_first_close,
        
        datediff(
            day, 
            cloud_users_agg.first_date_joined,
            message_overview.last_closed_at
        ) as days_submitter_date_joined_to_ticket_last_close,
        
        datediff(
            day, 
            accounts.created_at,
            tickets.created_at
        ) as days_account_created_to_ticket_created,
        
        datediff(
            day, 
            accounts.created_at,
            message_overview.first_closed_at
        ) as days_account_created_to_ticket_first_close,
        
        datediff(
            day, 
            accounts.created_at,
            message_overview.last_closed_at
        ) as days_account_created_to_ticket_last_close,

        --Conversation Metrics
        message_overview.conversation_admin_responses,
        message_overview.conversation_user_responses,
        message_overview.conversation_close_count,
        message_overview.conversation_admin_responses + message_overview.conversation_user_responses
            as total_responses

    from tickets
    left join message_overview using (ticket_id)
    left join tags using (ticket_id)
    left join all_assignees using (ticket_id)
    left join all_escalations using (ticket_id)
    left join all_links using (ticket_id)
    left join cloud_users_agg 
        on tickets.submitter_email = cloud_users_agg.email
    left join accounts
        on tickets.cloud_account_id = accounts.account_id

),

calc_business_slas as (

    select
        *,
        
        {{ business_minutes_between('first_message_at_business', 'first_response_at_business') }} as business_min_create_to_first_response,
        {{ business_minutes_between('first_message_at_business', 'first_closed_at_business') }} as business_min_create_to_first_close,
        {{ business_minutes_between('first_message_at_business', 'last_closed_at_business') }} as business_min_create_to_last_close,

        case 
            when severity = 'sev1' and business_min_create_to_first_response <= {{ var('support_sla_first_response_min_sev1') }} 
                then true 
            when severity = 'sev2' and business_min_create_to_first_response <= {{ var('support_sla_first_response_min_sev2') }} 
                then true
            when severity = 'sev3' and business_min_create_to_first_response <= {{ var('support_sla_first_response_min_sev3') }} 
                then true
            when severity = 'sev4' and business_min_create_to_first_response <= {{ var('support_sla_first_response_min_sev4') }} 
                then true
            when business_min_create_to_first_response <= {{ var('support_sla_first_response_min_sev1') }} -- treat no severity as sev1
                then true
            else false
        end as did_respond_in_sla, 
        
        case 
            when business_min_create_to_last_close <= {{ var('support_sla_close_min') }} 
                then true 
            else false
        end as did_close_in_sla,
        
        case 
            when first_message_at != first_message_at_business
                then true
            else false
        end as was_created_outside_business_hours
        

    from joined

),

final as ( 
    select 
        calc_business_slas.*,
        (
            'enterprise' IN (entitlements_end.top_plan,entitlements_start.top_plan) 
            or calc_business_slas.is_enterprise_tagged
        ) as is_enterprise,
        greatest(
            coalesce(entitlements_end.top_plan,entitlements_start.top_plan),
            coalesce(entitlements_start.top_plan,entitlements_end.top_plan)
        ) is null as is_unknown_user,
        greatest(
            coalesce(entitlements_end.top_plan,entitlements_start.top_plan),
            coalesce(entitlements_start.top_plan,entitlements_end.top_plan)
        ) as predicted_plan_tier
        
    from calc_business_slas

    cross join max_entitlements

    left outer join entitlements as entitlements_start
        on coalesce(calc_business_slas.requester_email,calc_business_slas.submitter_email) = entitlements_start.email
        and date_trunc(
            'day',
            least(
                coalesce(calc_business_slas.created_at, max_entitlements.date_day),
                max_entitlements.date_day
            )
        ) = date_trunc('day',entitlements_start.date_day)

    left outer join entitlements as entitlements_end
        on coalesce(calc_business_slas.requester_email,calc_business_slas.submitter_email) = entitlements_end.email
        and date_trunc(
            'day',
            least(
                coalesce(calc_business_slas.last_closed_at, max_entitlements.date_day),
                max_entitlements.date_day
            )
        ) = date_trunc('day',entitlements_end.date_day)

)

select * from final
where is_automated = false 
