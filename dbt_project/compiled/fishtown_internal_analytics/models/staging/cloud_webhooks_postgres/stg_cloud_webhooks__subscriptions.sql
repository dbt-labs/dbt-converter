with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_webhooks_postgres_public.subscriptions' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_webhooks_postgres_public.subscriptions

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_webhooks_postgres_emea_public.subscriptions' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_webhooks_postgres_emea_public.subscriptions

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_webhooks_postgres_au_public.subscriptions' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_webhooks_postgres_au_public.subscriptions

            
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
                then account_id::varchar
          else md5(database_source || account_id)
      end as account_id,

      account_id as tenant_account_id,
        case
          when database_source = 'cloud'
                then id::varchar
          else md5(database_source || id)
      end as subscription_id,

      id as tenant_subscription_id,
        name as subscription_name,
        description as subscription_description,
        client_url,
        http_status_code,
        hmac_secret,
        job_ids as tenant_job_ids,
        event_types,

        active,

        created_at,
        updated_at,

        archived,
        archived_at,

        dispatched_at,
        dispatch_failure_count,
        deactivate_reason

    from source
),

dedupe as (

    select *
    from renamed
    qualify row_number() over (partition by subscription_id order by created_at desc) = 1

)

select * from dedupe