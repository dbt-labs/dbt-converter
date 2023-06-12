

with

accounts_snapshot as (

    select * from analytics_dev.dbt_jstein.base__cloud_accounts_snapshot

),

all_days as (

    select * from analytics_dev.dbt_jstein.all_days

),

accounts_deduped as (

    select
        *,
        row_number() over (
            partition by account_id, dbt_valid_from::date
            order by dbt_valid_from desc
        ) as _dedupe

    from accounts_snapshot
    qualify _dedupe = 1

),

--We started snapshotting accounts in 2017 for multi-tenant
--and August 2021 for single-tenant accounts. We want to ensure
--that this covers all account activities since the account was created
accounts_fix_valid_from as (

    select
        "DATABASE_SCHEMA",
  "DATABASE_SOURCE",
  "DATABASE_TYPE",
  "ACCOUNT_ID",
  "TENANT_ACCOUNT_ID",
  "_DBT_SOURCE_RELATION",
  "CREATED_AT",
  "UPDATED_AT",
  "NAME",
  "STATE",
  "ID",
  "RUN_SLOTS",
  "PLAN",
  "STRIPE_CUSTOMER_ID",
  "DEVELOPER_SEATS",
  "PENDING_CANCEL",
  "DOCS_JOB_ID",
  "FRESHNESS_JOB_ID",
  "ENTERPRISE_AUTHENTICATION_METHOD",
  "ENTERPRISE_LOGIN_SLUG",
  "ENTERPRISE_UNIQUE_IDENTIFIER",
  "BILLING_EMAIL_ADDRESS",
  "LOCKED",
  "LOCK_REASON",
  "UNLOCK_IF_SUBSCRIPTION_RENEWED",
  "DEVELOP_FILE_SYSTEM",
  "POD_MEMORY_REQUEST_MEBIBYTES",
  "READ_ONLY_SEATS",
  "UNLOCKED_AT",
  "STARTER_REPO_URL",
  "QUEUE_LIMIT",
  "SSO_REAUTH",
  "_FIVETRAN_DELETED",
  "_FIVETRAN_SYNCED",
  "GIT_AUTH_LEVEL",
  "RUN_DURATION_LIMIT_SECONDS",
  "DBT_SCD_ID",
  "DBT_UPDATED_AT",
  "UNIQUE_ID",
  "IDENTIFIER",
  "FORCE_SSO",
  "METRONOME_CUSTOMER_ID",
  "SALESFORCE_CUSTOMER_ID",

        lead(dbt_valid_from) over (partition by account_id order by dbt_valid_from) as next_dbt_valid_from,
        case
            when row_number () over (partition by account_id order by dbt_valid_from) = 1
            and created_at < dbt_valid_from
                then created_at
            else dbt_valid_from
        end as dbt_valid_from,

        case
            when dbt_valid_from::date = dbt_valid_to::date
            and  next_dbt_valid_from > dbt_valid_to
                then next_dbt_valid_from
            else dbt_valid_to
        end as dbt_valid_to

    from accounts_deduped

),

final as (

    select
        
    
md5(cast(coalesce(cast(all_days.date_day as TEXT), '') || '-' || coalesce(cast(accounts_fix_valid_from.account_id as TEXT), '') as TEXT)) as id,

        all_days.date_day,

        accounts_fix_valid_from.account_id::varchar as account_id,
        tenant_account_id,
        stripe_customer_id,

        all_days.date_day = accounts_fix_valid_from.created_at::date as is_account_first_day,
        datediff(day, accounts_fix_valid_from.created_at, all_days.date_day) as days_since_account_first_day,

        database_source,
        database_type,

        name,
        plan,
        

case
    when RIGHT( plan, 5 ) ='_2022'
        then split_part(plan,'_',1)
    else plan
end 

 as plan_tier,

        run_slots,
        read_only_seats,
        developer_seats,

        
    case
        when state = 2
            then 1
        else 0
    end as is_account_feature_flag_deleted
,
        locked as is_locked,
        lock_reason,

        enterprise_authentication_method,
        enterprise_authentication_method is not null as is_sso,

        created_at,
        updated_at

    from accounts_fix_valid_from
    join all_days on
        all_days.date_day >= accounts_fix_valid_from.dbt_valid_from::date
        and (all_days.date_day::date < coalesce(accounts_fix_valid_from.dbt_valid_to::date, '2099-01-01'))
    where all_days.date_day <= current_date()

)

select * from final