with

source as (

    {% set current_table = 'environment' %}
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
            renamed_column_name = 'environment_id'
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
        type as environment_type,
        supports_docs,

        -- There are a few records with the below string values in place for NULL. This logic ensure they resolve to NULL.
        case
            when dbt_version in ('','null','NULL','None') then null
            else dbt_version
        end as dbt_version,

        notification_email,
        use_custom_branch,
        custom_branch,

        {{ postgres_is_deleted('state', 'is_environment_deleted') }},

        created_at,
        updated_at


    from source

)

select * from renamed
