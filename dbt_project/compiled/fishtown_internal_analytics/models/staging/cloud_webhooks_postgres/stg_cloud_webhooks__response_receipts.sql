with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_webhooks_postgres_public.response_receipts' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_webhooks_postgres_public.response_receipts

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_webhooks_postgres_emea_public.response_receipts' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_webhooks_postgres_emea_public.response_receipts

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_webhooks_postgres_au_public.response_receipts' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_webhooks_postgres_au_public.response_receipts

            
        )

        
),

hashed_source as (
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
      end as response_receipts_id,

      id as tenant_response_receipts_id,
        case
          when database_source = 'cloud'
                then subscription_id::varchar
          else md5(database_source || subscription_id)
      end as subscription_id,

      subscription_id as tenant_subscription_id,
        case
          when database_source = 'cloud'
                then event_id::varchar
          else md5(database_source || event_id)
      end as event_id,

      event_id as tenant_event_id,

        error_info,
        request_headers,
        request_body,
        http_status_code,
        response_body,

        created_at,
        dispatched_at

    from source
),

dedupe as (

    select *
    from hashed_source
    qualify row_number() over (partition by response_receipts_id order by created_at desc) = 1

)

select * from dedupe