with

source as (

    {% set current_table = 'job_definition' %}
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
            renamed_column_name = 'job_definition_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'environment_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'project_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'deferring_job_definition_id'
        ) }},

        name,
        state,
        execute_steps,
        generate_docs,
        cron,

        -- There are a few records with the below string values in place for NULL. This logic ensure they resolve to NULL.
        case
            when dbt_version in ('','null','NULL','None') then null
            else dbt_version
        end as dbt_version,

        date_definition_type,
        time_definition_type,
        triggers_github_webhook,
        triggers_git_provider_webhook,
        triggers_schedule,
        settings_target_name,
        settings_threads,

        {{ postgres_is_deleted('state', 'is_job_definition_deleted') }},

        created_at,
        updated_at

    from source

)

select * from renamed
