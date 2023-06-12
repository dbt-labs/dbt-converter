with

accounts_snapshot as (

    select
        *,
        id as account_id

    from {{ref('cloud_accounts_snapshot')}}

),

accounts as (

    select * from {{ ref('fct_cloud_accounts') }}

),

web_events as (

    select * from {{ ref('stg_snowplow_web_events') }}

),

marketing_visits as (

    select
        domain_userid::varchar as account_id,
        '1 - marketing site visit' as event_name,
        min(collector_tstamp)::timestamp_tz as event_timestamp

    from web_events
    where app_id = 'getdbt.com'
        and event_name = 'page_view'
    group by 1

),

new_accounts as (

    select
        account_id::varchar as account_id,
        '2 - account created' as event_name,
        created_at as event_timestamp

    from accounts

),

-- project has a repo created and connection
onboarded_accounts as (

    select
        account_id::varchar as account_id,
        '3 - account onboarded' as event_name,
        greatest(first_connection_created_at, first_repo_created_at) as event_timestamp

    from accounts
    where first_connection_created_at is not null
        and first_repo_created_at is not null

),

-- accounts that have successfully run a job OR started IDE
activated_accounts as (

    select
        account_id::varchar as account_id,
        '4 - account activated' as event_name,
        case
            when first_successful_run_at is null then first_used_ide_at
            when first_used_ide_at is null then first_successful_run_at
            else least(first_successful_run_at, first_used_ide_at)
        end as event_timestamp

    from accounts
    where first_successful_run_at is not null
        or first_used_ide_at is not null

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
        min(accounts.first_paid_at::timestamp_tz) as event_timestamp

    from accounts_snapshot
    left join accounts
        on accounts_snapshot.account_id::varchar = accounts.account_id
    where accounts_snapshot.plan ilike 'team%'
    group by 1

),

unioned as (

    select * from marketing_visits
    union all
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
    where event_timestamp::date >= '2020-01-14'

)

select * from with_id
