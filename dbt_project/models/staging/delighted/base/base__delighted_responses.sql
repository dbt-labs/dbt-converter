with

source as (

    --this unions delighted projects together. when you add to this, update
    --the delighted_source_categorization macro to categorize correctly!

    {{ dbt_utils.union_relations(
        relations=[
            source('delighted_dbtcloud_nps', 'response'), 
            source('delighted_zendesk_csat', 'response'),
            source('delighted_thinkific_nps', 'response'),
            source('delighted_proserv_csat', 'response')
        ],
        source_column_name="feedback_source"
    ) }}

),

renamed as (

    select
    
        --ids
        id as response_id, --this seems to be unique across projects (for now at least!)
        person_id as delighted_user_id,

        {{ delighted_source_categorization() }}
        survey_type,
        score,
        comment,
        
        --available for all delighted people
        properties_delighted_source as survey_source,
        properties_delighted_device_type as device_type,
        properties_delighted_browser as browser,
        properties_delighted_operating_system as operating_system,

        --nps dimensions (both dbt cloud and thinkific)
        properties_delighted_referrer_url as referrer_url,
        properties_delighted_page_url as survey_page_url,
        properties_delighted_country as country,
        properties_delighted_page as survey_page,

        --just dbt cloud nps dimensions
        properties_global_user_id,
        properties_user_id as dbt_cloud_user_id,
        properties_account_id as dbt_cloud_account_id,
        properties_tenant_id as tenant_id,
        properties_global_user_id as global_user_id,
        properties_global_account_id as global_account_id,
        properties_environment_name as environment_name,
        properties_account_plan as account_plan,
        {{ plan_tiering('account_plan') }} as account_plan_tier,
        properties_is_multi_tenant as is_multi_tenant,
        properties_license as user_license_type,
        properties_delighted_visitor_type as visitor_type,
        properties_browser_timezone as browser_timezone,

        --zendesk CSAT properties
        properties_zendesk_assignee_name as zendesk_assignee_name, 
        properties_zendesk_ticket_id as zendesk_ticket_id,
        properties_zendesk_ticket_tags as zendesk_ticket_tags,
        properties_zendesk_requester_id as zendesk_requester_id,
        properties_zendesk_ticket_via as zendesk_ticket_via,
        properties_zendesk_ticket_url as zendesk_ticket_url,

        --pro-serv CSAT properties
        properties_salesforce_account_id as salesforce_account_id,
        properties_salesforce_opportunity_line_item as salesforce_opportunity_line_item_id,

        created_at::timestamp_tz as created_at,
        updated_at::timestamp_tz as updated_at,

        _fivetran_synced

    from source

)

select * from renamed
where created_at > '2021-03-17' --delighted NPS pushed live 2021-03-18