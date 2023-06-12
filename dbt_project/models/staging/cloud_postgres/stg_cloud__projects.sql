with

source as (

    {% set current_table = 'project' %}
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
            renamed_column_name = 'project_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'connection_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'repository_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'docs_job_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'freshness_job_id'
        ) }},
        
        name,

        state,
        {{ postgres_is_deleted('state', 'is_project_deleted') }},
        
        dbt_project_subdirectory,

        created_at,
        updated_at
        
    from source

)

select * from renamed
