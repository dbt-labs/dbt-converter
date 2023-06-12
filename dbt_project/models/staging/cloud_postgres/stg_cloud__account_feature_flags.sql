with

source as (

    {% set current_table = 'account_feature_flag' %}
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
        renamed_column_name = 'account_feature_flag_id'
      ) }},
      {{ id_hashing(
        original_column_name = 'account_id'
      ) }},
      feature_enabled,
      feature_name,

      case
        when feature_name ilike 'native_%'
            then 'SSO Feature Flag'
        else null
     end as sso_flag_type,

      state,
      {{ postgres_is_deleted('state', 'is_account_feature_flag_deleted') }},

      created_at,
      updated_at

  from source

)

select * from renamed
