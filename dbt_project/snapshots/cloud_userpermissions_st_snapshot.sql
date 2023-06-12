-- This snapshot is now responsible for not only ST deployments but
-- also for alternative (non-US east) MT deployments. This feels like
-- the simplest way to support new MT implementations. It will be hard
-- to rename this snapshot but we should revisit this when we have time
-- for warehouse cleanup ASAP.

{% snapshot cloud_userpermissions_st_snapshot %}

    {{
        config(
          strategy='timestamp',
          unique_key='unique_id',
          updated_at='updated_at'
        )
    }}


with

source as (

    {% set current_table = 'user_license' %}
    {% set source_relations = dbt_utils.get_relations_by_pattern(
            'fivetran_st%',
            current_table,
            database='RAW'
        )
    %}
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