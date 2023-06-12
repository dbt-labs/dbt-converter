with

source as (

    {% set current_table = 'custom_environment_variables' %}
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
            renamed_column_name = 'environment_variable_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'project_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'job_definition_id',
            renamed_column_name = 'job_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'environment_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'user_id'
        ) }},

        name,
        display_value as value,
        type as precedence_level,
        case precedence_level
            when 'user' then 1
            when 'job' then 2
            when 'environment' then 3
            when 'project' then 4
        end as precedence_ranking,
        {{ postgres_is_deleted('state', 'is_env_var_deleted') }},
        created_at,
        updated_at


    from source

)

select * from renamed