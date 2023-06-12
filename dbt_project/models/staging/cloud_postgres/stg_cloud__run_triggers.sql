with

source as (

    {% set current_table = 'run_trigger' %}
    {% set source_relations = dbt_utils.get_relations_by_pattern(
            'fivetran_st%',
            current_table,
            database='RAW'
        )
    %}
    {% do source_relations.append(source('cloud_postgres', current_table)) %}
    {% do source_relations.append(source('cloud_postgres_emea', current_table)) %}
    {% do source_relations.append(source('cloud_postgres_au', current_table)) %}

    {{ dbt_utils.union_relations(
        relations=source_relations
    )}}

),

renamed as (

    select
        {{ postgres_database_fields() }},
        {{ id_hashing(
            original_column_name = 'id', 
            renamed_column_name = 'trigger_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'job_definition_id'
        ) }},

        case
            when github_pull_request_id or gitlab_merge_request_id or azure_pull_request_id is not null
                then 'pull request'
            when cause = 'scheduled'
                then 'scheduled'
            when cause ilike 'Kicked off from UI by %'
                then 'manual'
            when cause ilike 'Kicked off from the UI by %'
                then 'manual'
            else 'api'
        end as trigger_type,

        -- user-supplied
        cause as trigger_cause,

        trigger_type = 'pull request' as is_pull_request_build,
        trigger_type = 'scheduled' as is_scheduled_run,
        trigger_type = 'api' as is_api_triggered,

        -- present if the run is kicked off via a webhook, else null
        coalesce (github_pull_request_id, gitlab_merge_request_id, azure_pull_request_id) as pull_request_number,
        case
            when github_pull_request_id is not null then 'github'
            when gitlab_merge_request_id is not null then 'gitlab'
            when azure_pull_request_id is not null then 'azure'
            else null
        end as pull_request_source,

        -- this will be set to a non-null value if:
        -- 1. this is a webhook build for a pull request, or
        -- 2. there is a custom branch configured for the environment, or
        -- 3. this run was triggered via the API with a custom branch parameter
        coalesce(git_branch, '<default>') as git_branch,

        -- this will be set to a non-null value if:
        -- 1. this is a webhook build for a pull request, or
        -- 2. this run was triggered via the API with a custom branch parameter
        git_sha,

        schema_override,
        steps_override,
        timeout_seconds_override,
        threads_override,
        generate_docs_override,
        target_name_override,

        created_at

    from source

)

select * from renamed
