with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.audit_log' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.audit_log

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.audit_log' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.audit_log

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.audit_log' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_au_public.audit_log

            
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
      end as audit_log_id,

      id as tenant_audit_log_id,

        case
          when database_source = 'cloud'
                then uuid::varchar
          else md5(database_source || uuid)
      end as uuid,

      uuid as tenant_uuid,

        case
          when database_source = 'cloud'
                then account_id::varchar
          else md5(database_source || account_id)
      end as account_id,

      account_id as tenant_account_id,

        case
          when database_source = 'cloud'
                then actor_id::varchar
          else md5(database_source || actor_id)
      end as actor_id,

      actor_id as tenant_actor_id,

        actor_type,
        actor_name,
        actor_ip,
        routing_key,

        service,
        source,
        domain,
        action,
        state,

        case
            when routing_key ilike '%loginsucceeded%'
                then true
            else false
        end as is_login_event,

        logged_at,
        created_at,
        updated_at,

        internal as is_internal,
        metadata,

        _fivetran_deleted,
        _fivetran_synced


    from source

),

clarify_ids as (

    select
        case
            when actor_type ilike 'actor_user'
                then actor_id
        end as user_id,

        case
            when actor_type ilike 'actor_user'
                then tenant_actor_id
        end as tenant_user_id,

        case
            when actor_type ilike 'actor_token_user'
                then actor_id
        end as service_token_id,

        case
            when actor_type ilike 'actor_token_user'
                then tenant_actor_id
        end as tenant_service_token_id,

        *

    from renamed

)

select * from clarify_ids