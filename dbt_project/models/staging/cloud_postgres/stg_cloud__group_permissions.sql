with 

source as  (
    
{% set current_table = 'group_permission' %}
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
            renamed_column_name = 'group_permission_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'group_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'project_id'
        ) }},

        permission_level,
        permission_set,

        all_projects as is_all_projects,
        {{ postgres_is_deleted('state', 'is_group_permission_deleted') }},

        created_at,
        updated_at

    from source

)

select * from renamed