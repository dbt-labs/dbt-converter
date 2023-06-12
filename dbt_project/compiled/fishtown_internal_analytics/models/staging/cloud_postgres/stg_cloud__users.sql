with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.auth_user' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.auth_user

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.auth_user' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.auth_user

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.auth_user' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_au_public.auth_user

            
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
      end as user_id,

      id as tenant_user_id,

        lower(email) as email,
        first_name,
        last_name,
        first_name||' '||last_name as name,
        

    split_part(
        email,
        '.',
        -1
        )

 as email_top_level_domain,

        is_active,
        is_staff,
        is_superuser,

        case
            when email ilike any ('%fishtownanalytics.com','%dbtlabs.com')
                then true
            when email in ('achen.fia@zenefits.com', 'jcohen.fia@zenefits.com')
                then true
            else false
        end as is_fishtown_user,

        

    date_joined as date_joined__og,
    convert_timezone(
      'UTC',
      date_joined
    ) as date_joined__ntz

,

        last_login

    from source

)

select * from renamed