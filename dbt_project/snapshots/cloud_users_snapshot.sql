{% snapshot cloud_users_snapshot %}

    {{
        config(
          strategy='timestamp',
          unique_key='unique_id',
          updated_at='last_login'
        )
    }}


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

)

select
    *,
    {{ dbt_utils.generate_surrogate_key([
        'lower(_dbt_source_relation)',
        'id'
    ]) }} as unique_id
from source

{% endsnapshot %}