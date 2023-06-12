with

source as (

    {% set current_table = 'email_verification' %}
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
            renamed_column_name = 'email_verification_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'user_id'
        ) }},

        email_address,
        case
            when verified_at is not null
                then 1
            else 0
        end as is_verified,
        created_at,
        verified_at

    from source

)

select * from renamed
