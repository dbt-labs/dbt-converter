{{
  config(
    materialized = "table"
  )
}}

with

accounts_snapshot as (

    select * from {{ ref('base__cloud_accounts_snapshot') }}

),

all_days as (

    select * from {{ ref('all_days') }}

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
        {{ dbt_utils.star(
            from=ref('base__cloud_accounts_snapshot'),
            except=["DBT_VALID_FROM", "DBT_VALID_TO"]
        ) }},

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
        {{ dbt_utils.generate_surrogate_key([
            'all_days.date_day',
            'accounts_fix_valid_from.account_id'
        ]) }} as id,

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
        {{ plan_tiering('plan') }} as plan_tier,

        run_slots,
        read_only_seats,
        developer_seats,

        {{ postgres_is_deleted('state', 'is_account_feature_flag_deleted') }},
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
