with source as (

    select * from {{ source('fivetran_googlesheets', 'rate_ro_raw_responses') }}

),

renamed as (

    select
        -- id and info
        {{ dbt_utils.generate_surrogate_key([
            'account_id', 
            'timestamp'
        ]) }} as rate_rapid_onboarding__survey_response_id,
        account_id,
        client_company_name,
        timestamp::timestamp as rapid_onboarding_completed_at,
        email_address as trainer_email_address,

        -- general questions
        responsiveness_ as responsiveness,
        account_project_setup as account_project_setup,
        preparedness as preparedness,
        participation as participation,
        dbt_enthusiasm as dbt_enthusiasm,
        point_of_contact as point_of_contact,

        -- exit criteria questions
        --- modeling
        modeling_every_source_has_a_1_1_relationship_with_a_staging_model_ as modeling_every_source_has_a_1_1_relationship_with_a_staging_model,
        modeling_minimum_1_fct_and_1_dim_tables_fct_dim_have_been_created_in_the_project_ as modeling_minimum_1_fct_and_1_dim_tables_fct_dim_have_been_created_in_the_project,
        modeling_no_raw_table_references_are_made_ref_macro_is_used_throughout_models_ as modeling_no_raw_table_references_are_made_ref_macro_is_used_throughout_models,
        modeling_using_the_surrogate_key_from_dbt_utils_in_at_least_one_model_ as modeling_using_the_surrogate_key_from_dbt_utils_in_at_least_one_model,
        modeling_import_ctes_utilized_ as modeling_import_ctes_utilized,
        modeling_fct_and_dim_models_materialized_as_tables_ as modeling_fct_and_dim_models_materialized_as_tables,
        --- sources
        sources_sources_are_configured_for_each_data_source_ as sources_sources_are_configured_for_each_data_source,
        sources_no_raw_table_references_are_made_source_macro_is_utilized_ as sources_no_raw_table_references_are_made_source_macro_is_utilized,
        sources_source_freshness_is_configured_in_dbt_cloud_ as sources_source_freshness_is_configured_in_dbt_cloud,
        --- tests
        tests_docs_tests_not_null_and_unique_tests_are_applied_to_primary_keys_on_all_models_ as tests_docs_tests_not_null_and_unique_tests_are_applied_to_primary_keys_on_all_models,
        tests_docs_tests_minimum_1_data_test_is_written_in_the_dbt_project_ as tests_docs_tests_minimum_1_data_test_is_written_in_the_dbt_project,
        tests_docs_docs_descriptions_for_model_and_key_columns_in_the_fct_dim_models_have_been_created_ as tests_docs_docs_descriptions_for_model_and_key_columns_in_the_fct_dim_models_have_been_created,
        tests_docs_docs_descriptions_for_model_and_key_findings_on_staging_int_models_ as tests_docs_docs_descriptions_for_model_and_key_findings_on_staging_int_models,
        tests_docs_docs_source_descriptions_capture_how_the_data_is_loaded_and_where_to_go_to_learn_more_ as tests_docs_docs_source_descriptions_capture_how_the_data_is_loaded_and_where_to_go_to_learn_more,
        --- deployment
        deployment_environments_minimum_1_dbt_cloud_job_is_configured_with_our_preferred_setup_ as deployment_environments_minimum_1_dbt_cloud_job_is_configured_with_our_preferred_setup,
        deployment_environments_source_freshness_is_snapshot_as_a_step_in_a_job_ as deployment_environments_source_freshness_is_snapshot_as_a_step_in_a_job,
        deployment_environments_documentation_is_being_generated_by_a_job_ as deployment_environments_documentation_is_being_generated_by_a_job,
        deployment_environments_notifications_are_set_up_for_jobs_through_slack_and_or_email_ as deployment_environments_notifications_are_set_up_for_jobs_through_slack_and_or_email,
        deployment_environments_run_on_pr_job_is_set_up_if_using_git_hub_ as deployment_environments_run_on_pr_job_is_set_up_if_using_git_hub,
        --- project
        project_readme_links_to_an_existing_company_owned_style_guide_ as project_readme_links_to_an_existing_company_owned_style_guide,
        project_readme_outline_style_of_project_and_how_to_contribute_ as project_readme_outline_style_of_project_and_how_to_contribute,
        project_pull_request_template_included_in_dbt_project_ as project_pull_request_template_included_in_dbt_project,
        project_pr_template_references_the_style_guide_ as project_pr_template_references_the_style_guide,
        project_dbt_utils_included_in_packages_yml_ as project_dbt_utils_included_in_packages_yml,
        project_process_documented_for_notifications_what_happens_when_a_run_fails_ as project_process_documented_for_notifications_what_happens_when_a_run_fails,
        --- other
        other_if_you_opted_in_snapshot_models_ as other_if_you_opted_in_snapshot_models,
        other_if_you_opted_in_implement_one_incremental_model_ as other_if_you_opted_in_implement_one_incremental_model,
        other_if_you_opted_in_schedule_a_dbt_run_with_and_without_a_full_refresh_ as other_if_you_opted_in_schedule_a_dbt_run_with_and_without_a_full_refresh,
        additional_services_recommendation as other_additional_services_recommendation,
        additional_services_context as other_additional_services_context,

        -- short answer
        trainer_experience,
        who_is_point_of_contact,
        discussion_topics,
        avoid_topics,
        red_flags,

        -- meta
        _row as gsheet_row,
        _fivetran_synced

    from source

)

select * from renamed
