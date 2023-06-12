{# create or replace table analytics.dbt_aescay.cloud_userpermissions_st_snapshot as ( #}
  
/*
    things to validate
    1. uniqe final record
    2. connected dates correctly from vaild from and valid to
    3. can the table union now with diff column order
 */

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
    from analytics.snapshots.cloud_userpermissions_st_snapshot
    order by dbt_valid_from

),

final as (

    select
        "_DBT_SOURCE_RELATION" as "_DBT_SOURCE_RELATION",
  "CREATED_AT" as "CREATED_AT",
  "UPDATED_AT" as "UPDATED_AT",
  "STATE" as "STATE",
  "ACCOUNT_ID" as "ACCOUNT_ID",
  "USER_ID" as "USER_ID",
  "LICENSE_TYPE" as "LICENSE_TYPE",
  "LEVEL" as "LEVEL",
  "ID" as "ID",
  "_FIVETRAN_DELETED" as "_FIVETRAN_DELETED",
  "_FIVETRAN_SYNCED" as "_FIVETRAN_SYNCED",
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

select id, lower(_dbt_source_relation), dbt_valid_from, count(*) from analytics.snapshots.cloud_userpermissions_st_snapshot group by 1, 2, 3 order by 4 desc;

select id, lower(_dbt_source_relation), dbt_valid_from, count(*) from analytics.dbt_aescay.cloud_userpermissions_st_snapshot group by 1, 2, 3 order by 4 desc;

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

    from analytics.dbt_aescay.cloud_userpermissions_st_snapshot

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

                cast('analytics.snapshots.cloud_userpermissions_snapshot' as 
    varchar
) as dbt_snapshot_relation,
                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("LEVEL" as NUMBER(38,0)) as "LEVEL" ,
                    cast("LICENSE_TYPE" as character varying(16777216)) as "LICENSE_TYPE" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast("_SDC_BATCHED_AT" as TIMESTAMP_TZ) as "_SDC_BATCHED_AT" ,
                    cast("_SDC_EXTRACTED_AT" as TIMESTAMP_TZ) as "_SDC_EXTRACTED_AT" ,
                    cast("_SDC_RECEIVED_AT" as TIMESTAMP_TZ) as "_SDC_RECEIVED_AT" ,
                    cast("_SDC_SEQUENCE" as NUMBER(38,0)) as "_SDC_SEQUENCE" ,
                    cast("_SDC_TABLE_VERSION" as NUMBER(38,0)) as "_SDC_TABLE_VERSION" ,
                    cast("DBT_SCD_ID" as character varying(32)) as "DBT_SCD_ID" ,
                    cast("DBT_UPDATED_AT" as TIMESTAMP_TZ) as "DBT_UPDATED_AT" ,
                    cast("DBT_VALID_FROM" as TIMESTAMP_TZ) as "DBT_VALID_FROM" ,
                    cast("DBT_VALID_TO" as TIMESTAMP_TZ) as "DBT_VALID_TO" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast(null as character varying(16777216)) as "_DBT_SOURCE_RELATION" ,
                    cast(null as character varying(32)) as "UNIQUE_ID" 

            from analytics.snapshots.cloud_userpermissions_snapshot
        )

        union all
        

        (
            select

                cast('analytics.dbt_aescay.cloud_userpermissions_st_snapshot' as 
    varchar
) as dbt_snapshot_relation,
                
                    cast("ACCOUNT_ID" as NUMBER(38,0)) as "ACCOUNT_ID" ,
                    cast("CREATED_AT" as TIMESTAMP_TZ) as "CREATED_AT" ,
                    cast("ID" as NUMBER(38,0)) as "ID" ,
                    cast("LEVEL" as NUMBER(38,0)) as "LEVEL" ,
                    cast("LICENSE_TYPE" as character varying(16777216)) as "LICENSE_TYPE" ,
                    cast("STATE" as NUMBER(38,0)) as "STATE" ,
                    cast("UPDATED_AT" as TIMESTAMP_TZ) as "UPDATED_AT" ,
                    cast("USER_ID" as NUMBER(38,0)) as "USER_ID" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_BATCHED_AT" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_EXTRACTED_AT" ,
                    cast(null as TIMESTAMP_TZ) as "_SDC_RECEIVED_AT" ,
                    cast(null as NUMBER(38,0)) as "_SDC_SEQUENCE" ,
                    cast(null as NUMBER(38,0)) as "_SDC_TABLE_VERSION" ,
                    cast("DBT_SCD_ID" as character varying(32)) as "DBT_SCD_ID" ,
                    cast("DBT_UPDATED_AT" as TIMESTAMP_TZ) as "DBT_UPDATED_AT" ,
                    cast("DBT_VALID_FROM" as TIMESTAMP_TZ) as "DBT_VALID_FROM" ,
                    cast("DBT_VALID_TO" as TIMESTAMP_TZ) as "DBT_VALID_TO" ,
                    cast("_FIVETRAN_DELETED" as BOOLEAN) as "_FIVETRAN_DELETED" ,
                    cast("_FIVETRAN_SYNCED" as TIMESTAMP_TZ) as "_FIVETRAN_SYNCED" ,
                    cast("_DBT_SOURCE_RELATION" as character varying(16777216)) as "_DBT_SOURCE_RELATION" ,
                    cast("UNIQUE_ID" as character varying(32)) as "UNIQUE_ID" 

            from analytics.dbt_aescay.cloud_userpermissions_st_snapshot
        )

        

),

fixed as (

    select
        "CREATED_AT" as "CREATED_AT",
  "UPDATED_AT" as "UPDATED_AT",
  "STATE" as "STATE",
  "ACCOUNT_ID" as "ACCOUNT_ID",
  "USER_ID" as "USER_ID",
  "LICENSE_TYPE" as "LICENSE_TYPE",
  "LEVEL" as "LEVEL",
  "ID" as "ID",
  "_FIVETRAN_DELETED" as "_FIVETRAN_DELETED",
  "_FIVETRAN_SYNCED" as "_FIVETRAN_SYNCED",
  "UNIQUE_ID" as "UNIQUE_ID",
  "DBT_SCD_ID" as "DBT_SCD_ID",
  "DBT_UPDATED_AT" as "DBT_UPDATED_AT",
  "DBT_VALID_FROM" as "DBT_VALID_FROM",
  "DBT_VALID_TO" as "DBT_VALID_TO",

        coalesce(
            _dbt_source_relation,
            'raw.fivetran_dbt_cloud_postgres_public.user_license'
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
      end as user_license_id,

      id as tenant_user_license_id,

        case
          when database_source = 'cloud'
                then account_id::varchar
          else md5(database_source || account_id)
      end as account_id,

      account_id as tenant_account_id,

        case
          when database_source = 'cloud'
                then user_id::varchar
          else md5(database_source || user_id)
      end as user_id,

      user_id as tenant_user_id,

        case
          when database_source = 'cloud'
                then dbt_scd_id::varchar
          else md5(database_source || dbt_scd_id)
      end as dbt_scd_id,

      dbt_scd_id as tenant_dbt_scd_id,

        "_DBT_SOURCE_RELATION" as "_DBT_SOURCE_RELATION",
  "CREATED_AT" as "CREATED_AT",
  "UPDATED_AT" as "UPDATED_AT",
  "STATE" as "STATE",
  "LICENSE_TYPE" as "LICENSE_TYPE",
  "LEVEL" as "LEVEL",
  "_FIVETRAN_DELETED" as "_FIVETRAN_DELETED",
  "_FIVETRAN_SYNCED" as "_FIVETRAN_SYNCED",
  "UNIQUE_ID" as "UNIQUE_ID",
  "DBT_UPDATED_AT" as "DBT_UPDATED_AT",
  "DBT_VALID_FROM" as "DBT_VALID_FROM",
  "DBT_VALID_TO" as "DBT_VALID_TO"

    from fixed

)

select
    user_license_id,
    lower(_dbt_source_relation),
    dbt_valid_from,
    count(*)
from enriched
group by 1,2,3
order by 4 desc;


select
    user_license_id,
    lower(_dbt_source_relation),
    dbt_valid_from,
    count(*)
from analytics.analytics.base__cloud_userpermissions_snapshot
group by 1,2,3
order by 4 desc;

-- replicate old snapshot to a backup table
{# 
create table analytics.snapshots.cloud_userpermissions_st_snapshot_backup as (

    select * from analytics.snapshots.cloud_userpermissions_st_snapshot

);

-- replace old snapshot table with corrected snapshot data

create or replace table analytics.snapshots.cloud_userpermissions_st_snapshot as (

    select * from analytics.dbt_aescay.cloud_userpermissions_st_snapshot

); #}

