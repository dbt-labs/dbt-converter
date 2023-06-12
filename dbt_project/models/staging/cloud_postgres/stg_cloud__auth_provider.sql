with 

source as  (
    
{% set current_table = 'auth_provider' %}
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
            renamed_column_name = 'auth_provider_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},

        slug,
        type as identity_provider,
        auth0_connection_id,
        use_auth0 as auth0_migration_status,
        {{ postgres_is_deleted('state', 'is_identity_provider_deleted') }},
        created_at,
        updated_at

    from source

)

select * from renamed