with

accounts as (

    select * from {{ ref('stg_cloud__accounts') }}
    where is_account_deleted = 0

),

cloud_mappings as (

    select * from {{ ref('cloud_account_mappings') }}

),

invocations as (

    select * from {{ ref('fct_dbt_invocations') }}

),

partner_connect_accounts as (

    select * from {{ ref('int_cloud__partner_connect_signups_unioned') }}

),

environments as (

    select * from {{ ref('dim_cloud_environments') }}

),

repos as (

    select * from {{ ref('stg_cloud__repos') }}

),

jobs as (

    select * from {{ ref('dim_cloud_jobs') }}

),

versions as (

    select * from {{ ref('dim_dbt_versions') }}

),

runtime_images as (

    select * from {{ ref('dbt_cloud_runtime_image_versions') }}

),

users as (

    select * from {{ ref('fct_cloud_users') }}

),

user_permissions as (

    select * from {{ ref('stg_cloud__user_licenses') }}
    where is_user_license_deleted = 0

),

auth_provider as (
    select * from {{ ref('stg_cloud__auth_provider') }}
    where is_identity_provider_deleted = 0

),


runs as (

    select * from {{ ref('stg_cloud__runs') }}

),

outbound_webhook_environments as (

    select * from {{ ref('dim_cloud_outbound_webhooks') }}

),

feature_flags as (

    select * from {{ ref('stg_cloud__account_feature_flags') }}

),

stripe_invoices as (

    select * from {{ ref('stg_cloud_stripe__invoices') }}
    where is_paid_invoice = true

),

stripe_customers as (

    select * from {{ ref('stg_cloud_stripe__customers') }}

),

salesforce_accounts as (

    select * from {{ ref('dim_salesforce_accounts') }}

),

cloud_metrics as (

    select * from {{ ref('fct_cloud_run_metrics') }}

),

ide_sessions as (

    select * from {{ ref('fct_cloud_ide_sessions') }}

),

metadata_usage as (

    select * from {{ ref('metadata_account_usage') }}

),

connections as (

    select * from {{ ref('stg_cloud__connections') }}

),

adapters as (

    select * from {{ ref('fct_cloud_project_connections') }}

),

projects as (

    select * from {{ ref('stg_cloud__projects') }}

),

semantic_layer_environments as (

    select * from {{ ref('dim_cloud_semantic_layers') }}

),

semantic_layer_queries as (

    select * from {{ ref('fct_semantic_layer_queries') }}

),

tenants as (

    select * from {{ ref('dim_cloud_tenants') }}

),

last_touch_conversions as (

    select * from {{ ref('fct_web_attribution') }}
    where attribution_model = 'Last Touch'
        and last_touch_points = 1
        and cloud_account_id is not null

),

invo_prep as (

    select
        cloud_account_id as account_id,
        started_at,
        project_count_metrics,
        count_python,
        row_number() over (
            partition by cloud_account_id, distribution
            order by started_at
        ) as invocation_number

    from invocations
    where distribution = 'cloud'

),

cloud_activations as (

    select
        account_id,
        min(case
                when invocation_number >= 100
                then started_at end
        ) as first_cloud_activated_at

    from invo_prep
    group by 1

),

service_tokens as (

    select * from {{ ref('stg_cloud__service_token') }}
    where is_service_token_deleted = 0

),

environments_aggregated as (

    select
        account_id,

        sum(
            case
                when environment_type = 'deployment'
                    then 1
                else 0
            end
        ) as all_time_deployment_environment_count,

        sum(
            case
                when environment_type = 'deployment' 
                    and is_environment_deleted = 0 
                        then 1
                else 0
            end
        ) as current_deployment_environment_count,

        min(created_at) as first_project_created_at,
        max(created_at) as last_project_created_at

    from environments
    group by 1

),

repos_aggregated as (

    select
        account_id,
        min(created_at) as first_repo_created_at,
        max(created_at) as last_repo_created_at

    from repos
    group by 1

),

jobs_aggregated as (
-- we can only pull min/max version RANK, so the following CTE will add back version

    select
        account_id,
        max(case when generate_docs = true then 1 else 0 end) as has_docs,
        max(case when count_steps_test > 0 then 1 else 0 end) as has_tests,
        max(case when count_steps_source > 0 then 1 else 0 end) as has_sources,
        max(case when count_steps_exposure > 0 then 1 else 0 end) as has_exposures,
        max(case when count_steps_snapshot > 0 then 1 else 0 end) as has_snapshots,
        max(case when count_steps_seed > 0 then 1 else 0 end) as has_seeds,
        max(case when count_environment_variables > 0 then 1 else 0 end) as has_environment_variables,
        min(created_at) as first_job_created_at,
        max(created_at) as last_job_created_at,
        min(versions.version_rank) as earliest_version_rank,
        max(versions.version_rank) as latest_version_rank,
        array_agg(distinct versions.dbt_semantic_version) as array_dbt_versions_used

    from jobs
    left join versions
        on jobs.dbt_semantic_version = versions.dbt_semantic_version
        and versions.is_prerelease = false
    group by 1

),

jobs_aggregated_with_version as (

    select 

        jobs_aggregated.*,
        earliest_version.dbt_semantic_version as min_dbt_version,
        latest_version.dbt_semantic_version as max_dbt_version,
        latest_version.major_version as max_major_version,
        latest_version.minor_version as max_minor_version

    from jobs_aggregated
    left join versions as earliest_version
        on jobs_aggregated.earliest_version_rank = earliest_version.version_rank
    left join versions as latest_version
        on jobs_aggregated.latest_version_rank = latest_version.version_rank

),

runs_aggregated as (

    select
        account_id,
        min(case when status = 'complete' then created_at end) as first_successful_run_at,
        max(case when status = 'complete' then created_at end) as last_successful_run_at,
        max(case when
            not runtime_images.is_latest_major -- still using v0.x
            and runs.created_at > dateadd(day, -7, current_date)
            then 1 else 0 end
        ) as has_used_previous_major_l7d

    from runs
    left join runtime_images
        on runs.dbt_version = runtime_images.version_image_name
    group by 1

),

outbound_webhooks_aggregated as (
    select
        account_id,
        iff(count(distinct event_id) > 0,1,0) as has_outbound_webhook,
        iff(sum(case when response_status_code = 200 then 1 else 0 end) > 0,1,0) as has_successful_webhook_event,
        min(created_at) as first_webhook_triggered_at,
        max(created_at) as last_webhook_triggered_at
    from outbound_webhook_environments
    group by 1
),

invocations_aggregated as (

    select
        account_id,
        min(started_at) as first_invocation_started_at,
        max(started_at) as last_invocation_started_at,
        iff(max(project_count_metrics) > 0,1,0) as has_metrics,
        iff(max(count_python) > 0,1,0) as has_python

    from invo_prep
    group by 1
),

feature_flags_aggregated as (

    select
        account_id,
        arrayagg(feature_name) as feature_flags,
        listagg(
            case
                when sso_flag_type is not null
                    then feature_name
            end,
             ','
        ) as enterprise_auth_method

    from feature_flags
    group by 1

),

service_tokens_filtered as (

    select
        account_id,
        true as has_service_token

    from service_tokens
    group by 1,2

),

-- this CTE is broken out separately since it doesn't rely on the is_paid_invoice flag
stripe_agg as (

    select distinct
        stripe_customer_id, 
        last_value(invoice_date) over (
            partition by stripe_customer_id
            order by invoice_date
        ) as last_invoice_at,
        -- we are using the last non-null CC expiration date to populate this field
        -- this is due to latency issues between invoices & charge
        -- if a charge isn't captured before model run, this could be null & trigger a test error
        last_value(cc_expiration_date) ignore nulls over (
            partition by stripe_customer_id
            order by invoice_date
        ) as cc_expiration_date,
        last_value(cc_failure_message) over (
            partition by stripe_customer_id
            order by invoice_date
        ) as cc_failure_message
    
    from stripe_invoices

),

users_aggregated as (

    select
        user_permissions.account_id,

        sum(
            case when user_permissions.license_type = 'developer' then 1 else 0 end
        ) as total_users_developers,

        sum(
            case when user_permissions.license_type = 'read_only' then 1 else 0 end
        ) as total_users_read_only,

        sum(is_verified) as total_users_verified,

        count(*) as total_users

    from user_permissions
    inner join users
        on user_permissions.user_id = users.user_id
    where users.is_active
      and not users.email ilike any ('%@fishtownanalytics.com', '%dbtlabs.com')

    group by 1

),

dates_calculated as (

    select distinct
        account_id,

        case
            when sum(is_successful_session) over(partition by account_id) = 0
                then null
            when rank() over(partition by account_id
                order by is_successful_session desc, coalesce(finished_at,created_at) desc) = 1
                then coalesce(finished_at,created_at)
        end as last_successful_action,

        datediff(
            'day', last_successful_action, current_date
        ) as days_since_last_successful_action

    from cloud_metrics

),

-- This CTE (sessions_aggregated) is aggregating session-level information about behavior to account-level booleans
-- The big idea is that we want to understand if an account has EVER hit one of these milestones
-- This is to help understand how we're doing over time w/r/t account activation in the IDE
-- We're checking equal to zero rather than NULLs since these start at zero
-- Later in the main query we check for 1 rather than against zero because the left join will have NULLs, not zeroes
sessions_aggregated as (

    select
        account_id,

        min(ready_at) as first_used_ide_at,
        max(ready_at) as last_used_ide_at,

        min(successful_invocation_start_time) as first_successful_ide_invocation_at,
        max(successful_invocation_start_time) as last_successful_ide_invocation_at,

        count(
            case 
                when is_failed_session = 1
                then develop_request_id
            end
        ) as failed_ide_sessions,

        count(
            case 
                when is_successful_session = 1
                then develop_request_id
            end
        ) as successful_ide_sessions,


        iff( max(is_successful_session) = 0, 0, 1) as has_successful_session,
        iff( max(count_successful_invocations) = 0, 0, 1) as has_successful_invocation,

        iff( max(count_compile_sql_operations) = 0, 0, 1) as has_compiled_sql,
        iff( max(count_run_sql_operations) = 0, 0, 1) as has_run_sql,

        max(case when
            not runtime_images.is_latest_major -- still using v0.x
            and is_successful_session = 1
            and ready_at > dateadd(day, -28, current_date)
            then 1 else 0 end
        ) as has_used_previous_major_l28d
    
    from ide_sessions
    left join runtime_images
        on ide_sessions.dbt_version = runtime_images.version_image_name
    group by 1

),

dates_aggregated as (

    select
        account_id,
        max(last_successful_action) as last_successful_action,
        max(days_since_last_successful_action) as days_since_last_successful_action,
        max(
          case when days_since_last_successful_action > 180 then 1 else 0 end
        ) as stale_account

    from dates_calculated
    group by 1

),

adapters_aggregated as (

    select
        account_id,
        count(distinct adapter) as adapter_count,
        listagg(distinct adapter,', ') within group (order by adapter) as adapters_used

    from adapters
    group by 1

),

projects_aggregated as (

    select
        account_id,
        count(*) as all_time_project_count,
        count(distinct 
            case
                when is_project_deleted = 1
                    then null
                else project_id
            end
        ) as current_project_count

    from projects
    group by 1

),

connections_aggregated as (

    select
        account_id,
        min(created_at) as first_connection_created_at,
        max(created_at) as last_connection_created_at

    from connections
    group by 1

),
 
auth_provider_aggregated as (

    select
        account_id,
        slug,
        identity_provider,
        auth0_migration_status,
        updated_at 

    from auth_provider
    qualify row_number() over (partition by account_id order by created_at desc) = 1

),

semantic_layers_aggregated as (

    select
        account_id,
        iff(count(distinct semantic_layer_id) > 0,1,0) as has_semantic_layer_environment,
        iff(max(had_successful_run) > 0,1,0) as has_successful_semantic_layer_run,
        min(created_at) as first_semantic_layer_created_at

    from semantic_layer_environments
    group by 1
),

semantic_layer_queries_aggregated as (

    select 
        account_id,
        iff(max(is_active_semantic_layer_usage) > 0,1,0) as has_active_semantic_layer_queries

    from semantic_layer_queries
    group by 1

),

joined as (

    select
        accounts.*,
        
        tenants.instance_name,
        tenants.instance_name_md5,
        cloud_mappings.customer_id,
        cloud_mappings.customer_id_type,
        cloud_mappings.organization_id,
        cloud_mappings.salesforce_account_id,
        cloud_mappings.sfdc_parent_account_id,
        cloud_mappings.is_primary_cloud_account,
        cloud_mappings.customer_name,
        cloud_mappings.is_paying_account,
        cloud_mappings.is_current_paying_account,
        coalesce(cloud_mappings.is_internal_account, false) as is_internal_account,

        min_dbt_version,
        max_dbt_version,
        array_dbt_versions_used,

        iff(has_docs = 1, 1, 0) as has_docs,
        iff(has_tests = 1, 1, 0) as has_tests,
        iff(has_sources = 1, 1, 0) as has_sources,
        iff(has_snapshots = 1, 1, 0) as has_snapshots,
        iff(has_exposures = 1, 1, 0) as has_exposures,
        iff(has_seeds = 1, 1, 0) as has_seeds,

        iff(has_python = 1, 1, 0) as has_python,
        iff(has_metrics = 1, 1, 0) as has_metrics,

        case
        -- likely permanent criteria 
            when is_primary_cloud_account = false
                then false
            when is_partner_training_acct = true
                then false
            when is_test_account = true
                then false
        -- likely temporary criteria
            when accounts.plan_tier not in ('team', 'enterprise')
                then false
            when not (contains(adapters_used,'snowflake'))
                then false
            when accounts.database_type != 'multi-tenant'
                then false
            when accounts.database_source = 'cloud_emea'
                then false
        -- Particularly specific criteria 
            when to_date(first_semantic_layer_created_at) = '2022-08-12' -- Proxy for SL partner accounts
                then false
            when accounts.account_id = '16173'  --accounts.name = 'Sung Labs'
                then false
            when
                -- SL eligible when dbt version is 1.2 or higher
                (
                    (coalesce(max_major_version,0) = 1 and coalesce(max_minor_version,0) >=2)
                    or coalesce(max_major_version,0) >=2
                )

                then true
            else false
        end as is_semantic_layer_eligible,
        iff(has_semantic_layer_environment = 1, 1, 0) as has_semantic_layer_environment,
        iff(has_successful_semantic_layer_run = 1, 1, 0) as has_successful_semantic_layer_run,
        iff(has_active_semantic_layer_queries = 1, 1, 0) as has_active_semantic_layer_queries,
        case
            when is_semantic_layer_eligible
                 and has_successful_semantic_layer_run = 1
                 and has_active_semantic_layer_queries = 1
                then 1
            else 0
        end as has_used_semantic_layer,

        iff(has_environment_variables = 1, 1, 0) as has_environment_variables,
        iff(has_successful_session = 1, 1, 0) as has_successful_session,
        iff(has_successful_invocation = 1, 1, 0) as has_successful_invocation,
        iff(has_compiled_sql = 1, 1, 0) as has_compiled_sql,
        iff(has_run_sql = 1, 1, 0) as has_run_sql,
        iff(has_external_metadata_api_requests = 1, 1, 0) as has_external_metadata_api_requests,
        iff(has_metadata_api_requests = 1, 1, 0) as has_metadata_api_requests,
        iff(has_model_bottleneck_viz_events = 1, 1, 0) as has_model_bottleneck_viz_events,
        first_connection_created_at is not null as has_connected_warehouse,
        first_repo_created_at is not null as has_created_repo,

        case
            when environments_aggregated.all_time_deployment_environment_count >= 1
                then true
            else false
        end as has_created_deployment_environment,

        first_job_created_at is not null as has_created_job,
        first_successful_run_at is not null as has_successful_run,
        iff(has_outbound_webhook = 1, 1, 0) as has_outbound_webhook,
        iff(has_successful_webhook_event = 1, 1, 0) as has_delivered_outbound_webhook,

        first_project_created_at,
        last_project_created_at,
        first_connection_created_at,
        last_connection_created_at,
        first_repo_created_at,
        last_repo_created_at,
        first_invocation_started_at,
        last_invocation_started_at,
        first_job_created_at,
        last_job_created_at,
        first_successful_run_at,
        last_successful_run_at,
        first_webhook_triggered_at,
        last_webhook_triggered_at,

        first_used_ide_at,
        last_used_ide_at,
        first_successful_ide_invocation_at,
        last_successful_ide_invocation_at,
        first_metadata_api_request_at,
        last_metadata_api_request_at,
        first_model_bottleneck_viz_at,
        last_model_bottleneck_viz_at,

        failed_ide_sessions,
        successful_ide_sessions,

-- For this next session, per David Krevitt, deployment stages could be:
-- signup (done nothing)
-- onboarded
-- has run dbt
-- job created
-- successful job

        case 
            when has_successful_run 
                then true
            else false 
        end as is_deployed,

        case
            when has_successful_run
                then '5. Successful Job Run'
            when has_created_job
                then '4. Created Job'
            when coalesce(has_successful_invocation,0) = 1 -- some values of the upstream field are null 
                then '3. Successful Invocation'
            when has_connected_warehouse 
                    and has_created_repo
                then '2. Onboarded'
            else '1. Signup'
        end as current_deployment_stage,

        case
            when has_successful_run
                then first_successful_run_at
            when has_created_job
                then first_job_created_at
            when coalesce(has_successful_invocation,0) = 1 -- some values of the upstream field are null 
                then first_invocation_started_at
            when has_connected_warehouse 
                    and has_created_repo
                then greatest(first_connection_created_at,first_repo_created_at)
            else accounts.created_at
        end as current_deployment_stage_timestamp,

        datediff(
            'day',
            accounts.created_at,
            current_deployment_stage_timestamp
        ) as days_to_current_deployment_stage,

        has_connected_warehouse
           and has_created_repo
           and coalesce(has_successful_invocation,0) = 1 -- some values of the upstream field are null 
           and has_created_job
           and is_deployed
        as is_full_deploy_path_captured,

        is_deployed and not(is_full_deploy_path_captured) as is_deployed_with_stage_gaps,

    ---------Historic Plan Timestamps
        cloud_mappings.first_developer_plan_at,
        salesforce_accounts.became_customer_on as first_paid_managed_at,
    
    --TECH DEBT [ric, 31 Jan 2023]
    --this follows the historical context but we should move to change this to `first_paid_team_at`
    --but this means you should also change fct_cloud_account_activities + fct_cloud_account_events
    --as these fields rely on it
        cloud_mappings.first_paid_team_at as first_paid_at,

        last_invoice_at,

        total_users_developers,
        total_users_read_only,
        total_users_verified,
        total_users,
        last_successful_action,
        days_since_last_successful_action,

        coalesce(environments_aggregated.all_time_deployment_environment_count,0) as all_time_deployment_environment_count,
        coalesce(environments_aggregated.current_deployment_environment_count,0) as current_deployment_environment_count,
        all_time_project_count,
        current_project_count,
        adapter_count,
        adapters_used,

        iff(accounts.plan_tier = 'enterprise', auth_provider_aggregated.slug, 'Other') AS enterprise_slug,
        iff(accounts.plan_tier = 'enterprise', auth_provider_aggregated.identity_provider, 'Other') AS identity_provider,
        auth_provider_aggregated.updated_at as auth_provider_updated_at,
        auth_provider_aggregated.auth0_migration_status as auth0_migration_status,

        feature_flags,
        nullif(
             coalesce(
                 auth0_enterprise_authentication_method,
                 feature_flags_aggregated.enterprise_auth_method
             ),
             ''
        ) as enterprise_authentication_method,

        enterprise_authentication_method is not null as is_sso,

        -- the below boolean indicates if an account has an active service token
        coalesce(service_tokens_filtered.has_service_token, false) as has_service_token,

        coalesce(stale_account,0) as stale_account,

        stripe_customers.billing_name,
        stripe_customers.email as billing_email,

        split_part(stripe_customers.email, '@', 2) as billing_domain,

        stripe_customers.address_line_1,
        stripe_customers.address_line_2,

        coalesce(
            stripe_customers.address_city,
            salesforce_accounts.billing_city
        ) as address_city,

        coalesce(
            stripe_customers.address_state,
            salesforce_accounts.billing_state
        ) as address_state,

        coalesce(
            stripe_customers.address_zip,
            salesforce_accounts.billing_postal_code
        ) as address_zip,

        coalesce(
            stripe_customers.address_country,
            salesforce_accounts.billing_country_code
        ) as address_country_code,

        coalesce(
            stripe_customers.address_country_name,
            salesforce_accounts.billing_country
        ) as address_country,

        coalesce(
            stripe_customers.address_region_category,
            salesforce_accounts.billing_region_category
        ) as address_region_category,

        stripe_customers.address_string,

        case
            when current_date > dateadd(day, 30, last_invoice_at)
            and stripe_agg.cc_failure_message is not null
                then 'CC Failure - 30+ days after invoice date'
            else stripe_agg.cc_failure_message
        end as cc_failure_message,
        
        partner_connect_accounts.sign_up_source,

        stripe_agg.cc_expiration_date,
        datediff(day,current_date(),stripe_agg.cc_expiration_date) as days_to_cc_expiration,

    --Fields for Activation thresholds
        dateadd(day, 14, accounts.created_at) as cloud_activation_due_at,
        first_cloud_activated_at,

        case
            when first_connection_created_at is not null
                and first_repo_created_at is not null 
                and first_cloud_activated_at::date <= cloud_activation_due_at
                    then true
            else false
        end as did_reach_activation_threshold,

        -- still using major version 0?
        coalesce(runs_aggregated.has_used_previous_major_l7d, 0) as job_has_used_previous_major_l7d,
        coalesce(sessions_aggregated.has_used_previous_major_l28d, 0) as ide_has_used_previous_major_l28d,

        last_touch_conversions.channel as last_touch_conversion_channel,
        last_touch_conversions.marketing_campaign as last_touch_conversion_campaign

    from accounts
    left join cloud_mappings 
        on accounts.account_id = cloud_mappings.account_id
    left join environments_aggregated
        on accounts.account_id = environments_aggregated.account_id
    left join connections_aggregated
        on accounts.account_id = connections_aggregated.account_id
    left join adapters_aggregated
        on accounts.account_id = adapters_aggregated.account_id
    left join projects_aggregated
        on accounts.account_id = projects_aggregated.account_id
    left join repos_aggregated
        on accounts.account_id = repos_aggregated.account_id
    left join jobs_aggregated_with_version
        on accounts.account_id = jobs_aggregated_with_version.account_id
    left join runs_aggregated
        on accounts.account_id = runs_aggregated.account_id
    left join outbound_webhooks_aggregated
        on accounts.account_id = outbound_webhooks_aggregated.account_id
    left join invocations_aggregated
        on accounts.account_id = invocations_aggregated.account_id
    left join feature_flags_aggregated
        on accounts.account_id = feature_flags_aggregated.account_id
    left join service_tokens_filtered
        on accounts.account_id = service_tokens_filtered.account_id
    left join users_aggregated
        on accounts.account_id = users_aggregated.account_id
    left join stripe_agg
        on accounts.stripe_customer_id = stripe_agg.stripe_customer_id
    left join dates_aggregated
        on accounts.account_id = dates_aggregated.account_id
    left join sessions_aggregated
        on accounts.account_id = sessions_aggregated.account_id
    left join cloud_activations
        on accounts.account_id = cloud_activations.account_id
    left join metadata_usage
        on accounts.account_id = metadata_usage.account_id
    left join semantic_layers_aggregated
        on accounts.account_id = semantic_layers_aggregated.account_id
    left join semantic_layer_queries_aggregated
        on accounts.account_id = semantic_layer_queries_aggregated.account_id
    left join tenants
        on accounts.database_source = tenants.database_source
    left join stripe_customers
        on accounts.stripe_customer_id = stripe_customers.stripe_customer_id
    left join salesforce_accounts
        on cloud_mappings.salesforce_account_id = salesforce_accounts.account_id
    left join partner_connect_accounts
        on accounts.account_id = partner_connect_accounts.dbt_cloud_account_id
    left join auth_provider_aggregated
        on accounts.account_id = auth_provider_aggregated.account_id
    left join last_touch_conversions
        on accounts.account_id = last_touch_conversions.cloud_account_id
    where (users_aggregated.total_users_verified > 0 or accounts.account_id = '1')
    --add our internal cloud account

)

select * from joined 
