with

accounts_snapshot as (

    select
        *,
        id as account_id

    from {{ref('cloud_accounts_snapshot')}}

),

accounts as (

    select * from {{ref('fct_cloud_accounts')}}

),

new_accounts as (

    select
        account_id::varchar as account_id,
        '2 - account created' as event_name,
        created_at as event_timestamp

    from accounts

),

onboarded_accounts as (

    select
        account_id::varchar as account_id,
        '3 - account onboarded' as event_name,
        greatest(
            first_project_created_at,
            first_connection_created_at
            ) as event_timestamp

    from accounts
    where first_project_created_at is not null
        and first_connection_created_at is not null

),

activated_accounts as (

    select
        account_id::varchar as account_id,
        '4 - account activated' as event_name,
        first_successful_run_at as event_timestamp

    from accounts
    where first_successful_run_at is not null

),

conversions_to_developer as (

    select
        account_id::varchar as account_id,
        '5a - account converted to developer plan' as event_name,
        min(dbt_valid_from)::timestamp_tz as event_timestamp

    from accounts_snapshot
    where plan ilike 'developer%'
    group by 1

),

conversions_to_team as (

    select
        accounts_snapshot.account_id::varchar as account_id,
        '5b - account converted to team plan' as event_name,
        min(first_paid_at::timestamp_tz) as event_timestamp

    from accounts_snapshot
    left join accounts
    on accounts_snapshot.account_id::varchar = accounts.account_id
    where accounts_snapshot.plan ilike 'team%'
    group by 1

),

unioned as (

    select * from new_accounts
    union all
    select * from onboarded_accounts
    union all
    select * from activated_accounts
    union all
    select * from conversions_to_developer
    union all
    select * from conversions_to_team

),

with_id as (

    select
        {{  dbt_utils.generate_surrogate_key([
            'account_id',
            'event_name',
            'event_timestamp'
        ]) }} as id,
        *

    from unioned
    where event_timestamp::date < '2020-01-14'

)

select * from with_id
