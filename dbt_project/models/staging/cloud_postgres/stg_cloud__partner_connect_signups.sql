with

source as (

    {% set current_table = 'partner_connect_signup' %}
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
            renamed_column_name = 'partner_connect_signup_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id', 
            renamed_column_name = 'dbt_cloud_account_id'
        ) }},

        case state
            when 1 then 'active'
            else 'deleted'
        end as status_name,
        
        partner_type as sign_up_source,      
        
        created_at,
        updated_at,
        host,
        activated_at

    from source

)

select * from renamed
where status_name = 'active'