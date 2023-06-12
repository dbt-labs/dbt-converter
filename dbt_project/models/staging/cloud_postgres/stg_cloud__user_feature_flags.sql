with

source as (

    {% set current_table = 'user_feature_flag' %}
    {% set source_relations = dbt_utils.get_relations_by_pattern(
            'fivetran_st%',
            current_table,
            database='RAW'
        )
    %}
    {% do source_relations.append(source('cloud_postgres', current_table)) %}
    {% do source_relations.append(source('cloud_postgres_emea', current_table)) %}

    {{ dbt_utils.union_relations(
        relations=source_relations
    )}}

),

renamed as (

    select
        {{ postgres_database_fields() }},
        {{ id_hashing(
            original_column_name = 'id', 
            renamed_column_name = 'user_feature_flag_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'user_id'
        ) }},

        feature_name,

        {{ postgres_is_deleted('state', 'is_user_feature_flag_deleted') }},

        created_at,
        updated_at

    from source
    where feature_enabled

)

select * from renamed
