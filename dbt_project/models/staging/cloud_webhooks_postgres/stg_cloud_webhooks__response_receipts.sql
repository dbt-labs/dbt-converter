with

source as (

    {% set current_table = 'response_receipts' %}
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

hashed_source as (
    select
        {{ postgres_database_fields() }},
        {{ id_hashing(
            original_column_name = 'id',
            renamed_column_name = 'response_receipts_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'subscription_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'event_id'
        ) }},

        error_info,
        request_headers,
        request_body,
        http_status_code,
        response_body,

        created_at,
        dispatched_at

    from source
),

dedupe as (

    select *
    from hashed_source
    qualify row_number() over (partition by response_receipts_id order by created_at desc) = 1

)

select * from dedupe