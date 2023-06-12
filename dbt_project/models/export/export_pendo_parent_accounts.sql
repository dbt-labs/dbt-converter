with

accounts as (

    select * from {{ ref('fct_cloud_accounts') }}
    where is_account_deleted = 0

),

salesforce_accounts as (

    select * from {{ ref('dim_salesforce_accounts') }}

),

final as (

    select

        -- dbt Cloud account info
        accounts.instance_name || '/' || accounts.tenant_account_id as pendo_parent_account_id,
        accounts.plan_tier as account_plan_tier,
        accounts.developer_seats as developer_seats,
        accounts.read_only_seats as read_only_seats,
        accounts.run_slots as run_slots,
        accounts.cc_failure_message,
        accounts.enterprise_authentication_method,

        -- booleans
        accounts.is_partner_training_acct,
        accounts.is_reseller_acct,
        accounts.is_locked,
        accounts.is_test_account,
        accounts.has_service_token,
        accounts.has_created_repo,
        accounts.has_created_deployment_environment,
        accounts.has_created_job,
        accounts.has_docs,
        accounts.has_successful_invocation,
        accounts.has_snapshots,
        accounts.has_sources,
        accounts.has_seeds,
        accounts.has_tests,

        -- timestamps
        accounts.first_paid_at,
        accounts.first_successful_run_at,
        accounts.last_successful_run_at,

        -- aggregations
        accounts.all_time_deployment_environment_count,
        accounts.all_time_project_count,
        accounts.current_deployment_environment_count,
        accounts.current_project_count,

        -- Salesforce account attributes
        salesforce_accounts.account_name as salesforce_account_name,
        salesforce_accounts.account_status as salesforce_account_status,
        salesforce_accounts.employee_count_range as salesforce_account_employee_count_range,
        salesforce_accounts.number_of_all_partnerships as salesforce_account_number_of_all_partnerships

    from accounts
    left join salesforce_accounts
        on accounts.salesforce_account_id = salesforce_accounts.account_id

)

select * from final
