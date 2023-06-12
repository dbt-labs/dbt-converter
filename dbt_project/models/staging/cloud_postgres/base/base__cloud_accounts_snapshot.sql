with

unioned as (

    {{ dbt_utils.union_relations(
        relations=[ref('cloud_accounts_snapshot'), 
                   ref('cloud_accounts_st_snapshot')],
        source_column_name='dbt_snapshot_relation'
    ) }}

),

fixed as (

    select
        {{ dbt_utils.star(
            from=ref('cloud_accounts_st_snapshot'),
            except=["_DBT_SOURCE_RELATION"]
        ) }},

        coalesce(
            _dbt_source_relation,
            'raw.fivetran_dbt_cloud_postgres_public.database_account'
        ) as _dbt_source_relation
            --This is a temporary fix until we change all multi-tenant
            --accounts to use the hashed identifier
    from unioned

),

enriched as (

    select
        {{ postgres_database_fields() }},

        {{ id_hashing(
            original_column_name = 'id', 
            renamed_column_name = 'account_id'
        ) }},

        {{ dbt_utils.star(
            from=ref('cloud_accounts_st_snapshot'),
            except=["ACCOUNT_ID"]
        ) }}

    from fixed

)

select * from enriched
where _dbt_source_relation is not null