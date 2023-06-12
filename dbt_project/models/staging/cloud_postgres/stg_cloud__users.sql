with

source as (

    {% set current_table = 'auth_user' %}
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
            renamed_column_name = 'user_id'
        ) }},

        lower(email) as email,
        first_name,
        last_name,
        first_name||' '||last_name as name,
        {{ dbt_tld.parse_tld('email') }} as email_top_level_domain,

        is_active,
        is_staff,
        is_superuser,

        case
            when email ilike any ('%fishtownanalytics.com','%dbtlabs.com')
                then true
            when email in ('achen.fia@zenefits.com', 'jcohen.fia@zenefits.com')
                then true
            else false
        end as is_fishtown_user,

        {{ timezone_conversion('date_joined') }},

        last_login

    from source

)

select * from renamed
