{{
  config(
    materialized = "table"
  )
}}

with

user_license_snapshot as (


    select * from {{ ref('base__cloud_userpermissions_snapshot') }}

),

users as (

    select * from {{ ref('stg_cloud__users') }}

),

all_days as (

  select * from {{ ref('all_days') }}

),

licenses_deduped as (

    select *,
        row_number() over (
            partition by user_id, account_id, dbt_valid_from::date
            --we use user_id, account_id because if a user on an account
            --has a license removed and then granted another, then they
            --can be given another user_license_id 
            order by dbt_valid_from desc
        ) as _dedupe

    from user_license_snapshot
    qualify _dedupe = 1

),

--We started snapshotting user licenses in 2017 for multi-tenant
--and August 2021 for single-tenant accounts. We want to ensure
--that this covers all user license activities since the license was created
licenses_fix_valid_from as (

    select
        {{ dbt_utils.star(
            from=ref('base__cloud_userpermissions_snapshot'),
            except=["DBT_VALID_FROM"]
        ) }},
        case
            when row_number () over (
                partition by user_id, account_id
                order by dbt_valid_from) = 1
            and created_at < dbt_valid_from
                then created_at
            else dbt_valid_from
        end as dbt_valid_from

    from licenses_deduped

),

enriched as (

    select
        licenses_fix_valid_from.*,
        users.email

    from licenses_fix_valid_from
    left join users using (user_id)

),

spined as (

    select
        all_days.date_day,

        user_license_id,
        account_id,
        tenant_account_id,
        user_id,
        tenant_user_id,
        email,

        database_source,
        database_type,

        license_type,
        level,

        {{ postgres_is_deleted('state', 'is_user_license_deleted') }},
        created_at,
        updated_at

    from enriched
    join all_days on
        all_days.date_day >= enriched.dbt_valid_from::date
        and (all_days.date_day::date < coalesce(enriched.dbt_valid_to::date, '2099-01-01'))
    where all_days.date_day <= current_date()

),

final as (

    select

        {{ dbt_utils.generate_surrogate_key([
            'date_day',
            'account_id',
            'user_id',
        ]) }} as id,

        *,

        -- we only want one license per user+account per day
        -- but some deleted licenses are going to stick around
        row_number() over (
            partition by account_id, user_id, date_day
            order by updated_at desc
        ) as _dedupe

    from spined
    qualify _dedupe = 1

)

select * from final
