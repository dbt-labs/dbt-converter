with

source as (

    {% set current_table = 'audit_log' %}
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
            renamed_column_name = 'audit_log_id'
        ) }},

        {{ id_hashing(
            original_column_name = 'uuid'
        ) }},

        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},

        {{ id_hashing(
            original_column_name = 'actor_id',
        ) }},

        actor_type,
        actor_name,
        actor_ip,
        routing_key,

        service,
        source,
        domain,
        action,
        state,

        case
            when routing_key ilike '%loginsucceeded%'
                then true
            else false
        end as is_login_event,

        logged_at,
        created_at,
        updated_at,

        internal as is_internal,
        metadata,

        _fivetran_deleted,
        _fivetran_synced


    from source

),

clarify_ids as (

    select
        case
            when actor_type ilike 'actor_user'
                then actor_id
        end as user_id,

        case
            when actor_type ilike 'actor_user'
                then tenant_actor_id
        end as tenant_user_id,

        case
            when actor_type ilike 'actor_token_user'
                then actor_id
        end as service_token_id,

        case
            when actor_type ilike 'actor_token_user'
                then tenant_actor_id
        end as tenant_service_token_id,

        *

    from renamed

)

select * from clarify_ids
