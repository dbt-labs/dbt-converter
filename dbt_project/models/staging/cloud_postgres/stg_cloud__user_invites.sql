with

source as (

    {% set current_table = 'invites' %}
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
            renamed_column_name = 'invite_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'account_id'
        ) }},

        -- group_ids, -- todo: figure out how to dynamically re-cast IDs, this comment out might break things
        
        email_address as invited_email_address,
        license_type,
        permission_level,
        
        case 
            when status = 1 
                then 'pending'
            when status = 2
                then 'redeemed'
            when status = 3 
                then 'expired'
        end as status,
        
        -- these fields might be kinda redundant
        status = 2 as is_redeemed,
        status = 3 as is_expired,

        created_at,
        redeemed_at

    from source

)

select * from renamed
