with

source as (

    {% set current_table = 'service_token' %}
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
            renamed_column_name = 'service_token_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        uid,
        name,
        token,
        {{ postgres_is_deleted('state', 'is_service_token_deleted') }},
        metadata_only,
        webhooks_only,
        last_used,
        created_at,
        updated_at
        
    from source

)

select * from renamed
