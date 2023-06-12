with

response_receipts as (
    select * from {{ref('stg_cloud_webhooks__response_receipts')}}
),

events as (
    select * from {{ref('stg_cloud_webhooks__events')}}
),

subscriptions as (
    select * from {{ref('stg_cloud_webhooks__subscriptions')}}
),

subscriptions_parsed as (
    select distinct
        client_url,
        parse_url(subscriptions.client_url, 1) as client_url_parsed,
        client_url_parsed:fragment as client_urlfragment,
        client_url_parsed:host as client_urlhost,
        client_url_parsed:parameters as client_urlparameters,
        client_url_parsed:path as client_urlpath,
        client_url_parsed:port as client_urlport,
        client_url_parsed:query as client_urlquery,
        client_url_parsed:scheme as client_urlscheme
    from subscriptions
),

cloud_accounts as (
    select account_id, is_test_account from {{ref('stg_cloud__accounts')}}
),


outbound_webhook_events as (
    select
        {{ dbt_utils.generate_surrogate_key([
                'subscriptions.account_id',
                'events.event_id',
                'response_receipts.dispatched_at'
        ]) }} as unique_id,

        events.database_schema,
        events.database_source,
        events.database_type,

        events.event_id,
        events.account_id,
        events.tenant_account_id,

        events.subscription_id,
        subscriptions.subscription_name,
        subscriptions.subscription_description,
        subscriptions_parsed.client_url,
        subscriptions_parsed.client_urlhost,
        subscriptions_parsed.client_urlpath,
        
        events.dbt_version,
        events.project_id,
        events.project_name,
        events.environment_id,
        events.environment_name,
        events.job_id,
        events.job_name,
        events.job_run_id,
        events.job_run_reason,
        events.job_run_started_at,
        events.job_run_status,
        events.job_run_status_code,
        events.job_run_status_message,
        events.trigger_event_type,

        events.http_status_code as request_status_code,
        response_receipts.request_headers,
        response_receipts.request_body,
        response_receipts.http_status_code as response_status_code,
        response_receipts.error_info,
        response_receipts.response_body,

        events.created_at,
        events.updated_at,
        response_receipts.dispatched_at,
        response_receipts.created_at as response_received_at

    from events
    left join response_receipts
        on events.database_schema = response_receipts.database_schema
        and events.event_id = response_receipts.event_id
        and events.subscription_id = response_receipts.subscription_id
    left join subscriptions
        on events.database_schema = subscriptions.database_schema
        and events.account_id = subscriptions.account_id
        and events.subscription_id = subscriptions.subscription_id
    left join subscriptions_parsed
        on subscriptions.client_url = subscriptions_parsed.client_url
    inner join cloud_accounts -- filter for non-internal accounts
        on events.account_id = cloud_accounts.account_id
        and cloud_accounts.is_test_account = False
)

select * from outbound_webhook_events