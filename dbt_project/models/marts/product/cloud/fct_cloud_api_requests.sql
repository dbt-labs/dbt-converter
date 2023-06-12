{{
    config(
        materialized='incremental',
        unique_key='event_id',
        snowflake_warehouse = set_warehouse_config('large')
    )
}}

with

account_plan_history as (

    select * from {{ ref('int_cloud__account_plan_history') }}

),

cloud_users as (

    select * from {{ ref('fct_cloud_user_group_permissions') }}

),

partner_connect_accounts as (

    select * from {{ ref('int_cloud__partner_connect_signups_unioned') }}

),

cloud_api_requests as (

    select * from {{ ref('stg_dbt_cloud__api_requests') }}

    where
        1 = 1

        {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{ var('testing_days_of_data') }}, current_date)

    {% endif %}

        {% if is_incremental() %}

            and _loaded_at >= (select max(_loaded_at) from {{ this }})

        {% endif %}

),

final as (

    select distinct
        cloud_api_requests.event_id,
        cloud_api_requests._loaded_at,
        cloud_api_requests.method,
        cloud_api_requests.path,
        cloud_api_requests.query_params,
        cloud_api_requests.user_agent,
        cloud_api_requests.api_version,
        cloud_api_requests.auth_type,
        cloud_api_requests.request_at,
        cloud_api_requests.has_query_pagination,
        cloud_api_requests.query_param_limit,
        cloud_api_requests.query_param_offset,
        cloud_api_requests.query_param_include_related,
        cloud_api_requests.query_param_order_by,

        cloud_api_requests.account_id,
        cloud_api_requests.user_id,
        cloud_api_requests.tenant_account_id,
        cloud_api_requests.tenant_user_id,
        cloud_api_requests.database_source,

        account_plan_history.plan as account_plan,
        account_plan_history.plan_tier as account_plan_tier,

        cloud_users.license_type,

        partner_connect_accounts.sign_up_source as partner_connect_source

    from cloud_api_requests

    left join account_plan_history
        on
            cloud_api_requests.account_id = account_plan_history.account_id
            and cloud_api_requests.request_at >= account_plan_history.start_date
            and cloud_api_requests.request_at < account_plan_history.end_date
    left join cloud_users
        on
            cloud_api_requests.user_id = cloud_users.user_id
            and cloud_api_requests.account_id = cloud_users.account_id
    left join partner_connect_accounts
        on
            cloud_api_requests.account_id
            = partner_connect_accounts.dbt_cloud_account_id

)

select * from final
