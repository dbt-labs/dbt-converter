with

single_tenant_docs_flattened as (

    {{ dbt_utils.unpivot(
        ref('stg_cloud_s3_single_tenant_docs'), 
        cast_to='varchar', 
        exclude=['single_tenant_name','database_source'],
        remove=[
            'base_url', 
            'alias_url', 
            'cloud_provider',
            'primary_nat_ip',
            'secondary_nat_ip',
            'aks_managed_nat_ip',
            'secondary_nat_ip_masked_raw',
            'cluster_information',
            'database_information',
            'environment_information',
            'network_information'
        ],
        value_name='mapping_value'

    ) }}

),

single_tenant_gsheet_flattened as (

    {{ dbt_utils.unpivot(
        ref('stg_googlesheets__singletenant_lookup'), 
        cast_to='varchar', 
        exclude=['deployment','database_source'],
        remove=[
            'ip', 
            'database_schema', 
            'database_type',
            '_fivetran_synced'
        ],
        value_name='mapping_value'

    ) }}

),

single_tenant_docs_typed as (

    select
        's3_docs' as mapping_source,
        1 as mapping_priority,
        *,
        case
            when field_name ilike '%nat_ip%'
                then 'ip_address'
            when field_name ilike '%host%'
                then 'url_host'
            else lower(field_name)
        end as mapping_field_type,

        {{ dbt_utils.generate_surrogate_key([
            'database_source',
            'field_name'   
        ]) }} as unique_id
    
    from single_tenant_docs_flattened
    where mapping_value != 'NULL'

),

single_tenant_gsheet_typed as (

    select
        'gsheet_mapping' as mapping_source,
        2 as mapping_priority,
        deployment as single_tenant_name,
        database_source,
        field_name,
        mapping_value,
        case
            when field_name ilike '%masked%'
                then 'ip_address'
            when field_name ilike '%host%'
                then 'url_host'
            else lower(field_name)
        end as mapping_field_type,

        {{ dbt_utils.generate_surrogate_key([
            'database_source',
            'field_name'   
        ]) }} as unique_id
    
    from single_tenant_gsheet_flattened
    where database_source is not null

),

final as (

    select * from single_tenant_docs_typed

    union all

    select * from single_tenant_gsheet_typed
    where mapping_value != 'NULL'

)

-- this qualify statement is meant to make sure that we only take the primary value
-- across both the s3 bucket and gsheet
select * from final
    qualify row_number() over (
        partition by mapping_value, mapping_field_type, database_source
        order by mapping_priority
    ) = 1
