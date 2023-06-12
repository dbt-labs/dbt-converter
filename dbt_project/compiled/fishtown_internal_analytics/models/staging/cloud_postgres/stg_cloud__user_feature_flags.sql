with

source as (

    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.user_feature_flag' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.user_feature_flag

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.user_feature_flag' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.user_feature_flag

            
        )

        

),

renamed as (

    select
        
    lower(split_part(_dbt_source_relation, '.', 2)) as database_schema,

    case
        when database_schema ilike 'fivetran_st%'
            then regexp_replace(database_schema, 'fivetran_st_|_public', '')
        when database_schema in ('fivetran_dbt_cloud_postgres_public', 'fivetran_webhooks_postgres_public')
            then 'cloud'
        when database_schema in ('fivetran_dbt_cloud_postgres_emea_public', 'fivetran_webhooks_postgres_emea_public')
            then 'cloud_emea'
        when database_schema in ('fivetran_dbt_cloud_postgres_au_public', 'fivetran_webhooks_postgres_au_public')
            then 'cloud_au'
    end as database_source,

    case
        when database_schema ilike 'fivetran_st%'
            then 'single-tenant'
        else 'multi-tenant'
    end as database_type

    -- tenancy region
    -- tenancy provider

,
        case
          when database_source = 'cloud'
                then id::varchar
          else md5(database_source || id)
      end as user_feature_flag_id,

      id as tenant_user_feature_flag_id,
        case
          when database_source = 'cloud'
                then user_id::varchar
          else md5(database_source || user_id)
      end as user_id,

      user_id as tenant_user_id,

        feature_name,

        
    case
        when state = 2
            then 1
        else 0
    end as is_user_feature_flag_deleted
,

        created_at,
        updated_at

    from source
    where feature_enabled

)

select * from renamed