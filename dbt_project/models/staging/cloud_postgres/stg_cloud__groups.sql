with

source as (

    {% set current_table = 'group%' %}
    {% set source_relations = fishtown_internal_analytics.get_relations_by_pattern(
            'fivetran_st%',
            current_table,
            database='RAW',
            quote_table=True
        )
    %}
   {% do source_relations.append(source('cloud_postgres', 'group')) %}
   {% do source_relations.append(source('cloud_postgres_emea', 'group')) %}
   {% do source_relations.append(source('cloud_postgres_au', 'group')) %}

    {{ dbt_utils.union_relations(
        relations=source_relations
    )}}

),

renamed as (

    select
        {{ postgres_database_fields() }},
        {{ id_hashing(
            original_column_name = 'id', 
            renamed_column_name = 'group_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},

        name as group_name,
        assign_by_default,
        sso_mapping_groups,

        {{ postgres_is_deleted('state', 'is_group_deleted') }},

        created_at,
        updated_at

    from source

)

select * from renamed
