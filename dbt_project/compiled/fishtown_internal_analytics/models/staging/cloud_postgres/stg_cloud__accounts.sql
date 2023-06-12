with

source as (

    
    
    
    
    

    

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_public.database_account' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_public.database_account

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_emea_public.database_account' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_emea_public.database_account

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_dbt_cloud_postgres_au_public.database_account' as TEXT) as _dbt_source_relation,

                

            from raw.fivetran_dbt_cloud_postgres_au_public.database_account

            
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
      end as account_id,

      id as tenant_account_id,
        stripe_customer_id,

        --account info
        name,
        plan,
        

case
    when RIGHT( plan, 5 ) ='_2022'
        then split_part(plan,'_',1)
    else plan
end 

 as plan_tier,
        run_slots,
        read_only_seats + developer_seats as total_seats,
        read_only_seats,
        developer_seats,
        billing_email_address,

        name ilike '%(Partner)%' as is_partner_training_acct,
        -- Accounts with a 5x suffix denote they are a reseller account sold by 5x
        -- these accounts are not yet paying teams accounts, and should not yet be included in Customer counts
        -- Slack thread for more context: https://dbt-labs.slack.com/archives/C0101LM7Z89/p1670560904713559
        name ilike any('%(5x)','5x Dev%') as is_reseller_acct,

        case 
        -- We know these are tripped by %test% logic so until we get a standard indicator
        -- we want to do this with as little hardcoding as possible.
            when name ilike '%greatest%'
                then false
            when name ilike '%latest%'
                then false
            when name ilike '%statestreet%'
                then false
            when name ilike '%testlio%'
                then false
        -- the original criteria
            when (name ilike '%dbt%support%' and plan = 'enterprise')
            --for single-tenant support accts
                then true
            when name ilike '%test%'
                then true
            when name ilike '%sandbox%'
                then true
            else false
        end as is_test_account,

        
    case
        when state = 2
            then 1
        else 0
    end as is_account_deleted
,

        case 
            when enterprise_authentication_method is not null
                then concat('auth0_', enterprise_authentication_method)
            else enterprise_authentication_method
        end as auth0_enterprise_authentication_method,

        locked as is_locked,
        lock_reason,

        --timestamps
        created_at,
        updated_at

    from source

)

select * from renamed