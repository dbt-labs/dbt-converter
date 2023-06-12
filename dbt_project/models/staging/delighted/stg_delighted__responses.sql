with

source as (

    select * from {{ ref('base__delighted_responses') }}

),

single_tenant_lookup as (

    select * from {{ ref('single_tenant_mappings') }}
    where mapping_field_type = 'url_host'

),

joined as (

    select
        -- keys
        source.*,

        case
            when tenant_id = 'cloud.getdbt.com'
                then 'cloud'
            when tenant_id = 'emea.getdbt.com'
                then 'cloud_emea'
            else single_tenant_lookup.database_source
        end as database_source

    from source
    left join single_tenant_lookup
        on source.tenant_id = single_tenant_lookup.mapping_value

),

enriched as (

    select
        {{ dbt_utils.star(from=ref('base__delighted_responses'),
            except=["DBT_CLOUD_USER_ID", "DBT_CLOUD_ACCOUNT_ID"]
        ) }},

        {{ id_hashing(
            original_column_name = 'dbt_cloud_user_id'
        ) }},

        {{ id_hashing(
            original_column_name = 'dbt_cloud_account_id'
        ) }}

    from joined

    -- explicit filter to prevent bringing in data that isn't properly mapped yet
    where ((dbt_cloud_account_id is not null and database_source is not null)
         or (dbt_cloud_account_id is null))

)

select * from enriched
