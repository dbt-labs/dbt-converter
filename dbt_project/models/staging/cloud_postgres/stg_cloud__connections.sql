with

source as (

    {% set current_table = 'connection_info' %}
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
            renamed_column_name = 'connection_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'created_by_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'project_id'
        ) }},

        name,
        state,
        --default_schema,
        --tunnel_enabled,
        type,

        {{ postgres_is_deleted('state', 'is_connection_deleted') }},

        created_at,
        updated_at

    from source

)

select * from renamed
