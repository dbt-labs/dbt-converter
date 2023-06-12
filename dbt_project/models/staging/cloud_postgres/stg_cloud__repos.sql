with

source as (

    {% set current_table = 'repository' %}
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
            renamed_column_name = 'repository_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'project_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'deploy_key_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'github_installation_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'repository_credentials_id'
        ) }},

        --dimensions
        full_name,
        state,
        remote_backend,

        remote_url,
        git_clone_strategy,
        pull_request_url_template,

        {{ postgres_is_deleted('state', 'is_repo_deleted') }},

        case
            -- these are more reliable than looking at the url for self-hosted deployments
            when git_clone_strategy = 'deploy_token' then 'GitLab'
            when git_clone_strategy = 'github_app' then 'GitHub'

            when remote_url ilike '%github%' then 'GitHub'
            when remote_url ilike '%bitbucket%' then 'Bitbucket'
            when remote_url ilike '%gitlab%' then 'GitLab'
            when remote_url ilike '%codecommit%' then 'CodeCommit'
            when remote_url ilike '%visualstudio%' then 'Visual Studio'
            when remote_url ilike '%azure%' then 'Azure'
            else 'Other'
        end as git_provider,

        case    
            when remote_backend = 'managed' then 1 
            else 0
        end as is_managed_repo,

        --timestamps
        created_at,
        updated_at

    from source

)

select * from renamed
