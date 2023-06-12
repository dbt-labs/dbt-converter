with

source as (

    {% set current_table = 'develop_request' %}
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
            renamed_column_name = 'develop_request_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'user_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'environment_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'project_id'
        ) }},

        status as status_id,
        status_message,

        case status
            when 1 then 'starting'
            when 2 then 'environment setup'
            when 3 then 'profile setup'
            when 4 then 'deps setup'
            when 10 then 'running'
            when 11 then 'ready'
            when 19 then 'stopping'
            when 20 then 'stopped ok'
            when 21 then 'stopped error'
        end as status_name,

        case
            when status_name = 'stopped error'
                then 1
            else 0
        end as is_failed_session,
        case
            when status_name = 'stopped ok'
                then 1
            else 0
        end as is_successful_session,

        -- could eventually determine dbt_minor_version from dbt_version = 'HEAD' by created_at date
        concat(regexp_substr(dbt_version, '(\\d+\\.+\\d+)'), '.x') as dbt_minor_version,

        upper(dbt_version) as dbt_version,
        container_version,
        pv_storage_class,

        created_at,
        environment_setup_started_at,
        profile_setup_started_at,
        deps_setup_started_at,
        running_at,
        first_successful_health_check_at::timestamp_ntz as first_successful_health_check_at,
        first_successful_filetree_request_at::timestamp_ntz as first_successful_filetree_request_at,
        ready_at::timestamp_ntz as ready_at,
        last_request_at,
        stopping_at,
        stopped_at,
        updated_at

    from source

)

select * from renamed