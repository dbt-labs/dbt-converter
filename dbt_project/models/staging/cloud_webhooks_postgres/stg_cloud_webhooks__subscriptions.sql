with

source as (

    {% set current_table = 'subscriptions' %}
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

renamed as (

    select
        {{ postgres_database_fields() }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'id',
            renamed_column_name = 'subscription_id'
        ) }},
        name as subscription_name,
        description as subscription_description,
        client_url,
        http_status_code,
        hmac_secret,
        job_ids as tenant_job_ids,
        event_types,

        active,

        created_at,
        updated_at,

        archived,
        archived_at,

        dispatched_at,
        dispatch_failure_count,
        deactivate_reason

    from source
),

dedupe as (

    select *
    from renamed
    qualify row_number() over (partition by subscription_id order by created_at desc) = 1

)

select * from dedupe
