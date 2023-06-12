{# create or replace table analytics.dbt_aescay.cloud_accounts_st_snapshot as ( #}

with 

original_snapshot as (

    select 
        *,
        md5(cast(coalesce(cast(lower(_dbt_source_relation) as 
    varchar
), '') || '-' || coalesce(cast(id as 
    varchar
), '') as 
    varchar
)) as unique_id_corrected,
        row_number() over (
            partition by unique_id_corrected, dbt_valid_from
            order by dbt_valid_from desc, dbt_valid_to asc
        ) as dedup_num
    from analytics.snapshots.cloud_accounts_st_snapshot
    order by dbt_valid_from

),

final as (

    select
        "_DBT_SOURCE_RELATION" as "_DBT_SOURCE_RELATION",
  "CREATED_AT" as "CREATED_AT",
  "UPDATED_AT" as "UPDATED_AT",
  "NAME" as "NAME",
  "STATE" as "STATE",
  "ID" as "ID",
  "RUN_SLOTS" as "RUN_SLOTS",
  "PLAN" as "PLAN",
  "STRIPE_CUSTOMER_ID" as "STRIPE_CUSTOMER_ID",
  "DEVELOPER_SEATS" as "DEVELOPER_SEATS",
  "PENDING_CANCEL" as "PENDING_CANCEL",
  "DOCS_JOB_ID" as "DOCS_JOB_ID",
  "FRESHNESS_JOB_ID" as "FRESHNESS_JOB_ID",
  "ENTERPRISE_AUTHENTICATION_METHOD" as "ENTERPRISE_AUTHENTICATION_METHOD",
  "ENTERPRISE_LOGIN_SLUG" as "ENTERPRISE_LOGIN_SLUG",
  "ENTERPRISE_UNIQUE_IDENTIFIER" as "ENTERPRISE_UNIQUE_IDENTIFIER",
  "BILLING_EMAIL_ADDRESS" as "BILLING_EMAIL_ADDRESS",
  "LOCKED" as "LOCKED",
  "LOCK_REASON" as "LOCK_REASON",
  "UNLOCK_IF_SUBSCRIPTION_RENEWED" as "UNLOCK_IF_SUBSCRIPTION_RENEWED",
  "DEVELOP_FILE_SYSTEM" as "DEVELOP_FILE_SYSTEM",
  "POD_MEMORY_REQUEST_MEBIBYTES" as "POD_MEMORY_REQUEST_MEBIBYTES",
  "READ_ONLY_SEATS" as "READ_ONLY_SEATS",
  "UNLOCKED_AT" as "UNLOCKED_AT",
  "STARTER_REPO_URL" as "STARTER_REPO_URL",
  "QUEUE_LIMIT" as "QUEUE_LIMIT",
  "SSO_REAUTH" as "SSO_REAUTH",
  "_FIVETRAN_DELETED" as "_FIVETRAN_DELETED",
  "_FIVETRAN_SYNCED" as "_FIVETRAN_SYNCED",
  "GIT_AUTH_LEVEL" as "GIT_AUTH_LEVEL",
  "RUN_DURATION_LIMIT_SECONDS" as "RUN_DURATION_LIMIT_SECONDS",
  "DBT_SCD_ID" as "DBT_SCD_ID",
  "DBT_UPDATED_AT" as "DBT_UPDATED_AT",
  "DBT_VALID_FROM" as "DBT_VALID_FROM",
  "DBT_VALID_TO" as "DBT_VALID_TO",
        unique_id_corrected as unique_id
    from original_snapshot
    where dedup_num = 1
)

select * from final
  
);

-- test if this fix removes duplicate starts/records

select id, lower(_dbt_source_relation), dbt_valid_from, count(*) from analytics.snapshots.cloud_accounts_st_snapshot group by 1, 2, 3 order by 4 desc;

select id, lower(_dbt_source_relation), dbt_valid_from, count(*) from analytics.dbt_aescay.cloud_accounts_st_snapshot group by 1, 2, 3 order by 4 desc;

-- test if this keeps the date swaps consistent

with window_functions as (

    select
        
        md5(cast(coalesce(cast(lower(_dbt_source_relation) as 
    varchar
), '') || '-' || coalesce(cast(id as 
    varchar
), '') as 
    varchar
)) as partition_by_col,
        
        dbt_valid_from as lower_bound,
        coalesce(
          dbt_valid_to,
          current_timestamp()
        )as upper_bound,

        lead(dbt_valid_from) over (
            partition by partition_by_col
            order by dbt_valid_from
        ) as next_lower_bound,

        row_number() over (
            partition by (partition_by_col)
            order by dbt_valid_from desc
        ) = 1 as is_last_record

    from analytics.dbt_aescay.cloud_accounts_st_snapshot

),

calc as (
    -- We want to return records where one of our assumptions fails, so we'll use
    -- the `not` function with `and` statements so we can write our assumptions nore cleanly
    select
        *,

        -- For each record: lower_bound should be < upper_bound.
        -- Coalesce it to return an error on the null case (implicit assumption
        -- these columns are not_null)
        coalesce(
            lower_bound < upper_bound,
            false
        ) as lower_bound_less_than_upper_bound,

        -- For each record: upper_bound = the next lower_bound.
        -- Coalesce it to handle null cases for the last record.
        coalesce(
            upper_bound = next_lower_bound,
            is_last_record,
            false
        ) as upper_bound_equal_to_next_lower_bound

    from window_functions

),

validation_errors as (

    select
        *
    from calc

    where not(
        -- THE FOLLOWING SHOULD BE TRUE --
        lower_bound_less_than_upper_bound
        and upper_bound_equal_to_next_lower_bound
    )
)

select * from validation_errors;

-- test if it can union properly

with

unioned as (

    

        (
            select

                cast('analytics.snapshots.cloud_accounts_snapshot' as 
    varchar
) as dbt_snapshot_relation,
                
                    cast("BILLING_EMAIL_ADDRESS" as character varying(16777216)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(16777216)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(16777216)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(16777216)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast("EXTRA_DEVELOPER_SEATS" as NUMBER(38,0)) as "EXTRA_DEVELOPER_SEATS" ,
                    cast("EXTRA_SEATS" as NUMBER(38,0)) as "EXTRA_SEATS" ,
                    cast("EXTRA_SLOTS" as NUMBER(38,0)) as "EXTRA_SLOTS" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("LOCK_REASON" as character varying(16777216)) as "LOCK_REASON" ,
                    cast("NAME" as character varying(16777216)) as "NAME" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("PLAN" as character varying(16777216)) as "PLAN" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(16777216)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("_SDC_BATCHED_AT" as TIMESTAMP_TZ) as "_SDC_BATCHED_AT" ,
                    cast("_SDC_EXTRACTED_AT" as TIMESTAMP_TZ) as "_SDC_EXTRACTED_AT" ,
                    cast("_SDC_RECEIVED_AT" as TIMESTAMP_TZ) as "_SDC_RECEIVED_AT" ,
                    cast("_SDC_SEQUENCE" as NUMBER(38,0)) as "_SDC_SEQUENCE" ,
                    cast("_SDC_TABLE_VERSION" as NUMBER(38,0)) as "_SDC_TABLE_VERSION" ,
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("DBT_SCD_ID" as character varying(32)) as "DBT_SCD_ID" ,
                    cast("DBT_UPDATED_AT" as TIMESTAMP_TZ) as "DBT_UPDATED_AT" ,
                    cast("DBT_VALID_FROM" as TIMESTAMP_TZ) as "DBT_VALID_FROM" ,
                    cast("DBT_VALID_TO" as TIMESTAMP_TZ) as "DBT_VALID_TO" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("GIT_AUTH_LEVEL" as character varying(16777216)) as "GIT_AUTH_LEVEL" ,
                    cast("STARTER_REPO_URL" as character varying(16777216)) as "STARTER_REPO_URL" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast(null as character varying(16777216)) as "_DBT_SOURCE_RELATION" ,
                    cast(null as character varying(32)) as "UNIQUE_ID" 

            from analytics.snapshots.cloud_accounts_snapshot
        )

        union all
        

        (
            select

                cast('analytics.dbt_aescay.cloud_accounts_st_snapshot' as 
    varchar
) as dbt_snapshot_relation,
                
                    cast("BILLING_EMAIL_ADDRESS" as character varying(16777216)) as "BILLING_EMAIL_ADDRESS" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("DOCS_JOB_ID" as NUMBER(38,0)) as "DOCS_JOB_ID" ,
                    cast("ENTERPRISE_AUTHENTICATION_METHOD" as character varying(16777216)) as "ENTERPRISE_AUTHENTICATION_METHOD" ,
                    cast("ENTERPRISE_LOGIN_SLUG" as character varying(16777216)) as "ENTERPRISE_LOGIN_SLUG" ,
                    cast("ENTERPRISE_UNIQUE_IDENTIFIER" as character varying(16777216)) as "ENTERPRISE_UNIQUE_IDENTIFIER" ,
                    cast(null as NUMBER(38,0)) as "EXTRA_DEVELOPER_SEATS" ,
                    cast(null as NUMBER(38,0)) as "EXTRA_SEATS" ,
                    cast(null as NUMBER(38,0)) as "EXTRA_SLOTS" ,
                    cast("FRESHNESS_JOB_ID" as NUMBER(38,0)) as "FRESHNESS_JOB_ID" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("LOCKED" as BOOLEAN) as "LOCKED" ,
                    cast("LOCK_REASON" as character varying(16777216)) as "LOCK_REASON" ,
                    cast("NAME" as character varying(16777216)) as "NAME" ,
                    cast("PENDING_CANCEL" as BOOLEAN) as "PENDING_CANCEL" ,
                    cast("PLAN" as character varying(16777216)) as "PLAN" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("STRIPE_CUSTOMER_ID" as character varying(16777216)) as "STRIPE_CUSTOMER_ID" ,
                    cast("UNLOCK_IF_SUBSCRIPTION_RENEWED" as BOOLEAN) as "UNLOCK_IF_SUBSCRIPTION_RENEWED" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_BATCHED_AT" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_EXTRACTED_AT" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_RECEIVED_AT" ,
                    cast(null as NUMBER(38,0)) as "_SDC_SEQUENCE" ,
                    cast(null as NUMBER(38,0)) as "_SDC_TABLE_VERSION" ,
                    cast("DEVELOP_FILE_SYSTEM" as BOOLEAN) as "DEVELOP_FILE_SYSTEM" ,
                    cast("POD_MEMORY_REQUEST_MEBIBYTES" as NUMBER(38,0)) as "POD_MEMORY_REQUEST_MEBIBYTES" ,
                    cast("RUN_SLOTS" as NUMBER(38,0)) as "RUN_SLOTS" ,
                    cast("READ_ONLY_SEATS" as NUMBER(38,0)) as "READ_ONLY_SEATS" ,
                    cast("DEVELOPER_SEATS" as NUMBER(38,0)) as "DEVELOPER_SEATS" ,
                    cast("DBT_SCD_ID" as character varying(32)) as "DBT_SCD_ID" ,
                    cast("DBT_UPDATED_AT" as TIMESTAMP_TZ) as "DBT_UPDATED_AT" ,
                    cast("DBT_VALID_FROM" as TIMESTAMP_TZ) as "DBT_VALID_FROM" ,
                    cast("DBT_VALID_TO" as TIMESTAMP_TZ) as "DBT_VALID_TO" ,
                    cast("QUEUE_LIMIT" as NUMBER(38,0)) as "QUEUE_LIMIT" ,
                    cast("UNLOCKED_AT" as TIMESTAMP_TZ) as "UNLOCKED_AT" ,
                    cast("SSO_REAUTH" as BOOLEAN) as "SSO_REAUTH" ,
                    cast("GIT_AUTH_LEVEL" as character varying(16777216)) as "GIT_AUTH_LEVEL" ,
                    cast("STARTER_REPO_URL" as character varying(16777216)) as "STARTER_REPO_URL" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("RUN_DURATION_LIMIT_SECONDS" as NUMBER(38,0)) as "RUN_DURATION_LIMIT_SECONDS" ,
                    cast("_DBT_SOURCE_RELATION" as character varying(16777216)) as "_DBT_SOURCE_RELATION" ,
                    cast("UNIQUE_ID" as character varying(32)) as "UNIQUE_ID" 

            from analytics.dbt_aescay.cloud_accounts_st_snapshot
        )

        

),

fixed as (

    select
        "CREATED_AT" as "CREATED_AT",
  "UPDATED_AT" as "UPDATED_AT",
  "NAME" as "NAME",
  "STATE" as "STATE",
  "ID" as "ID",
  "RUN_SLOTS" as "RUN_SLOTS",
  "PLAN" as "PLAN",
  "STRIPE_CUSTOMER_ID" as "STRIPE_CUSTOMER_ID",
  "DEVELOPER_SEATS" as "DEVELOPER_SEATS",
  "PENDING_CANCEL" as "PENDING_CANCEL",
  "DOCS_JOB_ID" as "DOCS_JOB_ID",
  "FRESHNESS_JOB_ID" as "FRESHNESS_JOB_ID",
  "ENTERPRISE_AUTHENTICATION_METHOD" as "ENTERPRISE_AUTHENTICATION_METHOD",
  "ENTERPRISE_LOGIN_SLUG" as "ENTERPRISE_LOGIN_SLUG",
  "ENTERPRISE_UNIQUE_IDENTIFIER" as "ENTERPRISE_UNIQUE_IDENTIFIER",
  "BILLING_EMAIL_ADDRESS" as "BILLING_EMAIL_ADDRESS",
  "LOCKED" as "LOCKED",
  "LOCK_REASON" as "LOCK_REASON",
  "UNLOCK_IF_SUBSCRIPTION_RENEWED" as "UNLOCK_IF_SUBSCRIPTION_RENEWED",
  "DEVELOP_FILE_SYSTEM" as "DEVELOP_FILE_SYSTEM",
  "POD_MEMORY_REQUEST_MEBIBYTES" as "POD_MEMORY_REQUEST_MEBIBYTES",
  "READ_ONLY_SEATS" as "READ_ONLY_SEATS",
  "UNLOCKED_AT" as "UNLOCKED_AT",
  "STARTER_REPO_URL" as "STARTER_REPO_URL",
  "QUEUE_LIMIT" as "QUEUE_LIMIT",
  "SSO_REAUTH" as "SSO_REAUTH",
  "_FIVETRAN_DELETED" as "_FIVETRAN_DELETED",
  "_FIVETRAN_SYNCED" as "_FIVETRAN_SYNCED",
  "GIT_AUTH_LEVEL" as "GIT_AUTH_LEVEL",
  "RUN_DURATION_LIMIT_SECONDS" as "RUN_DURATION_LIMIT_SECONDS",
  "UNIQUE_ID" as "UNIQUE_ID",
  "DBT_SCD_ID" as "DBT_SCD_ID",
  "DBT_UPDATED_AT" as "DBT_UPDATED_AT",
  "DBT_VALID_FROM" as "DBT_VALID_FROM",
  "DBT_VALID_TO" as "DBT_VALID_TO",

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
        
    lower(split_part(_dbt_source_relation, '.', 2)) as database_schema,

    case
        when database_schema ilike 'fivetran_st%'
            then regexp_replace(database_schema, 'fivetran_st_|_public', '')
        else 'cloud'
    end as database_source,

    case
        when database_schema ilike 'fivetran_st%'
            then 'single-tenant'
        else 'multi-tenant'
    end as database_type

,

        case
          when database_source = 'cloud'
                then id::varchar
          else md5(database_source || id)
      end as account_id,

      id as tenant_account_id,

        "_DBT_SOURCE_RELATION" as "_DBT_SOURCE_RELATION",
  "CREATED_AT" as "CREATED_AT",
  "UPDATED_AT" as "UPDATED_AT",
  "NAME" as "NAME",
  "STATE" as "STATE",
  "ID" as "ID",
  "RUN_SLOTS" as "RUN_SLOTS",
  "PLAN" as "PLAN",
  "STRIPE_CUSTOMER_ID" as "STRIPE_CUSTOMER_ID",
  "DEVELOPER_SEATS" as "DEVELOPER_SEATS",
  "PENDING_CANCEL" as "PENDING_CANCEL",
  "DOCS_JOB_ID" as "DOCS_JOB_ID",
  "FRESHNESS_JOB_ID" as "FRESHNESS_JOB_ID",
  "ENTERPRISE_AUTHENTICATION_METHOD" as "ENTERPRISE_AUTHENTICATION_METHOD",
  "ENTERPRISE_LOGIN_SLUG" as "ENTERPRISE_LOGIN_SLUG",
  "ENTERPRISE_UNIQUE_IDENTIFIER" as "ENTERPRISE_UNIQUE_IDENTIFIER",
  "BILLING_EMAIL_ADDRESS" as "BILLING_EMAIL_ADDRESS",
  "LOCKED" as "LOCKED",
  "LOCK_REASON" as "LOCK_REASON",
  "UNLOCK_IF_SUBSCRIPTION_RENEWED" as "UNLOCK_IF_SUBSCRIPTION_RENEWED",
  "DEVELOP_FILE_SYSTEM" as "DEVELOP_FILE_SYSTEM",
  "POD_MEMORY_REQUEST_MEBIBYTES" as "POD_MEMORY_REQUEST_MEBIBYTES",
  "READ_ONLY_SEATS" as "READ_ONLY_SEATS",
  "UNLOCKED_AT" as "UNLOCKED_AT",
  "STARTER_REPO_URL" as "STARTER_REPO_URL",
  "QUEUE_LIMIT" as "QUEUE_LIMIT",
  "SSO_REAUTH" as "SSO_REAUTH",
  "_FIVETRAN_DELETED" as "_FIVETRAN_DELETED",
  "_FIVETRAN_SYNCED" as "_FIVETRAN_SYNCED",
  "GIT_AUTH_LEVEL" as "GIT_AUTH_LEVEL",
  "RUN_DURATION_LIMIT_SECONDS" as "RUN_DURATION_LIMIT_SECONDS",
  "UNIQUE_ID" as "UNIQUE_ID",
  "DBT_SCD_ID" as "DBT_SCD_ID",
  "DBT_UPDATED_AT" as "DBT_UPDATED_AT",
  "DBT_VALID_FROM" as "DBT_VALID_FROM",
  "DBT_VALID_TO" as "DBT_VALID_TO"

    from unioned

)

select
    tenant_account_id,
    lower(_dbt_source_relation),
    dbt_valid_from,
    count(*)
from enriched
group by 1,2,3
order by 4 desc;


select
    tenant_account_id,
    lower(_dbt_source_relation),
    dbt_valid_from,
    count(*)
from analytics.analytics.base__cloud_accounts_snapshot
group by 1,2,3
order by 4 desc;

{# -- replicate old snapshot to a backup table

create table analytics.snapshots.cloud_accounts_st_snapshot_backup as (

    select * from analytics.snapshots.cloud_accounts_st_snapshot

);

-- replace old snapshot table with corrected snapshot data

create or replace table analytics.snapshots.cloud_accounts_st_snapshot as (

    select * from analytics.dbt_aescay.cloud_accounts_st_snapshot

); #}

