with

source as (

    {% set current_table = 'events' %}
    {% set source_relations = dbt_utils.get_relations_by_pattern(
            'fivetran_webhooks%',
            current_table,
            database='RAW'
        )
    %}
    {% do source_relations.append(source('fivetran_webhooks_postgres', current_table)) %}
    {% do source_relations.append(source('fivetran_webhooks_postgres_emea', current_table)) %}
    {% do source_relations.append(source('fivetran_webhooks_postgres_au', current_table)) %}

    {{ dbt_utils.union_relations(
        relations=source_relations
    )}}
),

payload_extraction as (
    select
        {{ postgres_database_fields() }},
        account_id,
        id,
        subscription_id,
        payload,
        coalesce(payload:data:dbtVersion, payload:run:fields:dbtVersion) as dbt_version,
        coalesce(payload:data:environmentId, payload:run:fields:environmentId) as environment_id,
        coalesce(payload:data:environmentName, payload:run:fields:environmentName) as environment_name,
        coalesce(payload:data:jobId, payload:run:fields:jobId) as job_id,
        coalesce(payload:data:jobName, payload:run:fields:jobName) as job_name,
        coalesce(payload:data:projectId, payload:run:fields:projectId) as project_id,
        coalesce(payload:data:projectName, payload:run:fields:projectName) as project_name,
        coalesce(payload:data:runId, payload:run:fields:runId) as job_run_id,
        coalesce(payload:data:runReason, payload:run:fields:runReason) as job_run_reason,
        coalesce(payload:data:runStartedAt, payload:run:fields:runStartedAt) as job_run_started_at,
        coalesce(payload:data:runStatus, payload:run:fields:runStatus) as job_run_status,
        coalesce(payload:data:runStatusCode, payload:run:fields:runStatusCode) as job_run_status_code,
        coalesce(payload:data:runStatusMessage, payload:run:fields:runStatusMessage) as job_run_status_message,

        trigger_event_type,
        http_status_code,

        created_at,
        updated_at
    from source
),

hashed_source as (
    select
        database_schema,
        database_source,
        database_type,
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        dbt_version,
        
        {{ id_hashing(
            original_column_name = 'id',
            renamed_column_name = 'event_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'subscription_id'
        ) }},

        {{ id_hashing(
            original_column_name = 'environment_id'
        ) }},
        environment_name,

        {{ id_hashing(
            original_column_name = 'project_id'
        ) }},
        project_name,

        {{ id_hashing(
            original_column_name = 'job_id'
        ) }},
        job_name,

        {{ id_hashing(
            original_column_name = 'job_run_id'
        ) }},
        job_run_reason,
        job_run_started_at,
        job_run_status,
        job_run_status_code,
        job_run_status_message,

        trigger_event_type,
        http_status_code,

        created_at,
        updated_at
    from payload_extraction
),

dedupe as (

    select *
    from hashed_source
    qualify row_number() over (partition by event_id order by created_at desc) = 1

)

select * from dedupe