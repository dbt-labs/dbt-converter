with

source as (

    {% set current_table = 'run' %}
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

blocked_by_hashing as (

    select
        {{ postgres_database_fields() }},
        {{ id_hashing(
            original_column_name = 'id', 
            renamed_column_name = 'run_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'value',
            renamed_column_name = 'blocking_run_id'
        ) }}

    from source,
    lateral flatten(input => source.blocked_by) blocking_run_id

),

blocked_by_agg as (

    select
        run_id,
        array_agg(blocking_run_id) as blocked_by_ids,
        array_agg(tenant_blocking_run_id) as tenant_blocked_by_ids

    from blocked_by_hashing
    group by 1

),

renamed as (

    select
        {{ postgres_database_fields() }},
        {{ id_hashing(
            original_column_name = 'id', 
            renamed_column_name = 'run_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'environment_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'job_definition_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'trigger_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'deferring_run_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'executed_by_thread_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'owner_thread_id'
        ) }},

        status as status_code,
        status_message,
        dbt_version,
        notifications_sent,
        scribe_enabled,
        webhooks_delivered,
        
        created_at,
        should_start_at,
        dequeued_at,
        started_at,
        last_heartbeat_at,
        finished_at,
        last_checked_at,
        updated_at

    from source

),

final as (

    select
        *,

        decode(status_code,
            1, 'queued',
            3, 'running',
            10, 'complete',
            20, 'error',
            30, 'cancelled'
            )
        as status,

        case
            when status = 'error'
                then 1
            else 0
        end as is_failed_run,

        case
            when status = 'complete'
                then 1
            else 0
        end as is_successful_run,

        array_size(blocked_by_ids) as blocked_by_count

    from renamed
    left join blocked_by_agg using (run_id)

)

select * from final
