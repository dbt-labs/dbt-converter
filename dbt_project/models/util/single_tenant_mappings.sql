with

mapping_snapshot as (

    select * from {{ ref('single_tenant_mappings_snapshot') }}
    where
        single_tenant_name not in (
        'singletenantazure-sandbox',
        'singletenantazure-staging'
        )

),

-- This is a temporary change until we can configure a better fix
-- Ideally, this logic would be updated pre-snapshot (Brandon @ 6/2)
with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'database_source',
            'field_name',
            'dbt_updated_at'
        ])}} as id,
        *
    
    from mapping_snapshot
    where mapping_field_type in ('ip_address', 'url_host') -- to only look at relevant mapping fields
      and field_name != 'HAS_IP_WHITELISTING' -- to remove a data error in earlier snapshot history

    -- qualify here is to make sure we don't have any duplicates in mapping values downstream
    -- we'll also test this to make sure we don't cause breakeage again
    qualify row_number() over (
        partition by mapping_value, mapping_field_type, database_source
        order by mapping_priority, dbt_valid_from desc
    ) = 1
)

select * from with_id