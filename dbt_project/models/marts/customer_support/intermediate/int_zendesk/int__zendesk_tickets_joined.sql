-- SET: retrieve all columns that are product area - level 2 (detail columns)
-- retrieving all model columns
{%- set all_columns = adapter.get_columns_in_relation (
        ref('fct_support_ticket_current_field_values')
    )
-%}

-- retrieving custom product area detail columns
{% set re = modules.re %}
{%- set custom_detail_columns = [] -%}
{%- for column in all_columns -%}
    {# selecting columns that are suffixed `_detail` #}
    {% if re.search('_detail$', column.column, re.IGNORECASE) %}
        {%- do custom_detail_columns.append(column.column) -%}
    {% endif %}
{%- endfor -%}

with 

tickets as (

    select * from {{ ref('stg_zendesk__ticket') }}

),

users as (

    select * from {{ ref('stg_zendesk__user') }}

),

groups as (

    select * from {{ ref('stg_zendesk__group') }}

),

organizations as (

    select * from {{ ref('stg_zendesk__organization') }}

),

current_ticket_field_values as (

    select
        *,
        -- concatenating all product area detailed fields as a list of columns separated by a comma
        -- convert to null if returned an empty array
        nullif(
            array_to_string(
                -- build an array of fields while removing null values
                array_construct_compact(
                    {{ custom_detail_columns|join(',') }}
                ), ', '
            ), ''
        ) as product_area_detail
    from {{ ref('fct_support_ticket_current_field_values') }}

),

sfdc_cloud_accounts as (
    
    select * from {{ ref('cloud_account_mappings') }} 
    where is_primary_cloud_account = true
),

delighted_feedback as (

    select * from {{ ref('fct_delighted_feedback') }}
    where feedback_source = 'zendesk_csat'

),

ticket_exceptions as (

    select * from {{ ref('zendesk_organization_id_exceptions') }}

),

tickets_corrected as (

    select 
        tickets.* exclude organization_id,
        coalesce(
            ticket_exceptions.corrected_organization_id,
            tickets.organization_id
        ) as organization_id

    from tickets
    left join ticket_exceptions
        on tickets.ticket_id = ticket_exceptions.ticket_id

),

csat as (

    select
        *,
        row_number() over (
            partition by zendesk_ticket_id
            order by created_at desc
        ) as csat_index

    from delighted_feedback
    qualify csat_index = 1
    --sometimes a responder can go back and change their rating
    --on a ticket. this CTE takes the last rating on the ticket

),

joined as (

    select 
        
        case 
            when tickets_corrected.status = 'solved'
                then 'closed'
            else tickets_corrected.status 
        end as status,
        
        {{ dbt_utils.star(
            from=ref('stg_zendesk__ticket'),
            except=["STATUS",
                    "_FIVETRAN_SYNCED"],
            relation_alias = 'tickets_corrected'
        ) }},

        organizations.name as organization_name,
        sfdc_cloud_accounts.account_id as cloud_account_id,
        organizations.external_id as salesforce_account_id,
        current_ticket_field_values.severity,

        requester.external_id as requester_sfdc_contact_id,
        requester.created_at as requester_created_at,
        requester.updated_at as requester_updated_at,
        requester.role as requester_role,
        requester.email as requester_email,
        requester.name as requester_name,
        requester.is_active as is_requester_active,
        requester.locale as requester_locale,
        requester.time_zone as requester_time_zone,
        requester.last_login_at as requester_last_login_at,

        assignee.external_id as assignee_sfdc_contact_id,
        assignee.role as assignee_role,
        assignee.email as assignee_email,
        assignee.name as assignee_name,
        assignee.is_active as is_assignee_active,
        assignee.locale as assignee_locale,
        assignee.time_zone as assignee_time_zone,
        assignee.last_login_at as assignee_last_login_at,

        submitter.external_id as submitter_sfdc_contact_id,
        submitter.role as submitter_role,
        case when submitter.role in ('Agent','Admin')
            then true 
            else false
                end as is_agent_submitted,
        submitter.email as submitter_email,
        submitter.name as submitter_name,
        submitter.is_active as is_submitter_active,
        submitter.locale as submitter_locale,
        submitter.time_zone as submitter_time_zone,

        case 
            when tickets_corrected.status = 'closed' 
                then 0
            else 1
        end as is_open,
        
        case 
            when assignee_name ilike 'Marcus%Collins' then 1
            else 0
        end as is_test_ticket,  

        groups.name as group_name,
        csat.score as customer_rating,
        csat.comment as rating_remark,

        current_ticket_field_values.frustrated_customer::boolean as is_frustrated_customer,

        current_ticket_field_values.impacted_project_id,
        current_ticket_field_values.impacted_project_adapter,

        -- product area
        current_ticket_field_values.product_area,
        current_ticket_field_values.product_area_detail,

        -- [TEMP] known issue: https://www.notion.so/dbtlabs/Multiple-product-area-detail-fields-on-support-tickets-a9691abcc2e34e4f8a2e1337fd084186
        -- some outlier tickets have 2 detailed field filled, which are being concatenated
        -- this can happen when the product area (level 1) is edited
        -- keeping concatenation over random attribution to avoid cross-product area confusion
        -- creating a task to tackle this later on
        -- IMPACT: <0.5% of all tickets
        -- (<2% of ticket with a detailed product area specified)
        -- all fields above can be removed once this is fixed
        current_ticket_field_values.billing_detail,
        current_ticket_field_values.ide_detail,
        current_ticket_field_values.other_detail,
        current_ticket_field_values.cicd__git_detail,
        current_ticket_field_values.setup_detail,
        current_ticket_field_values.account_configuration_detail,
        current_ticket_field_values.project_code_detail,
        current_ticket_field_values.users__groups_detail,
        current_ticket_field_values.docs_detail
        --to be added once these are being actively used
--        current_ticket_field_values.core_detail,
--        current_ticket_field_values.api_detail,
--        current_ticket_field_values.authentication_detail,
--        current_ticket_field_values.ci_detail,
--        current_ticket_field_values.git_integration_detail,
--        current_ticket_field_values.implementation_process_detail,
--        current_ticket_field_values.metadata_detail,
--        current_ticket_field_values.notifications_detail,
--        current_ticket_field_values.scheduled_runs_detail,
--        current_ticket_field_values.security_detail,
--        current_ticket_field_values.warehouse_integration_detail

    from tickets_corrected
    left join users as requester
        on tickets_corrected.requester_id = requester.user_id
    left join users as assignee
        on tickets_corrected.assignee_id = assignee.user_id
    left join users as submitter
        on tickets_corrected.submitter_id = submitter.user_id
    left join current_ticket_field_values
        on tickets_corrected.ticket_id = current_ticket_field_values.ticket_id
    left join organizations
        on coalesce(
            tickets_corrected.organization_id,
            requester.organization_id,
            submitter.organization_id) = organizations.organization_id
    left join groups 
        on tickets_corrected.group_id = groups.group_id
    left join csat
        on tickets_corrected.ticket_id = csat.zendesk_ticket_id
    left join sfdc_cloud_accounts
        on organizations.external_id::varchar = sfdc_cloud_accounts.salesforce_account_id

)

select * from joined
where is_test_ticket = 0 
and cast(ticket_id as bigint) >= 79
and created_at >= '2021-05-19T10:14:30'
-- ticket 79 was first Zendesk customer ticket