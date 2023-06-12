with

runs as (

    select * from {{ ref('stg_cloud__runs') }}

),

develop_requests as (

    select * from {{ ref('int_cloud__develop_requests') }}

),

runs_renamed as (

    select
        account_id,
        created_at,
        finished_at,

        {{ dbt.datediff(
          "started_at",
          "finished_at",
          'second'
        ) }} as duration_in_sec,

        case
            when duration_in_sec <= 60
                then '0-60 seconds'
            when duration_in_sec > 60
                and duration_in_sec <= 120
                then '60-120 seconds'
            when duration_in_sec > 120
                and duration_in_sec <= 240
                then '120-240 seconds'
            when duration_in_sec > 240
                and duration_in_sec <= 360
                then '240-360 seconds'
            when duration_in_sec > 360
                and duration_in_sec <= 720
                then '360-720 seconds'
            when duration_in_sec > 720
                and duration_in_sec <= 1200
                then '720-1200 seconds'
            when duration_in_sec > 1200
                then '1200+ seconds'
        end as duration_tier,

        status as status_name,
        is_failed_run as is_failed_session,
        is_successful_run as is_successful_session,
        dbt_version,
        'cloud_run' as type

    from runs

),

develop_requests_renamed as (

    select
        account_id,
        created_at,
        stopped_at as finished_at,

        {{ dbt.datediff(
            "created_at",
            "stopped_at",
            'second'
        ) }}::int as duration_in_sec,

        -- :thinking:
        case
            when duration_in_sec <= 60
                then '0-60 seconds'
            when duration_in_sec > 60
                and duration_in_sec <= 120
                then '60-120 seconds'
            when duration_in_sec > 120
                and duration_in_sec <= 240
                then '120-240 seconds'
            when duration_in_sec > 240
                and duration_in_sec <= 360
                then '240-360 seconds'
            when duration_in_sec > 360
                and duration_in_sec <= 720
                then '360-720 seconds'
            when duration_in_sec > 720
                and duration_in_sec <= 1200
                then '720-1200 seconds'
            when duration_in_sec > 1200
                then '1200+ seconds'
        end as duration_tier,

        status_name,
        is_failed_session,
        is_successful_session,
        dbt_version,
        'develop_request' as type

    from develop_requests

),

unioned as (

    select * from runs_renamed
    union all
    select * from develop_requests_renamed

),

ranked as (

    select
        *,

        row_number() over(
            partition by account_id
            order by coalesce(finished_at,created_at) desc
        ) as overall_run_rank,

        row_number() over(
            partition by account_id, type
            order by coalesce(finished_at,created_at) desc
        ) as run_rank_by_type

    from unioned

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
          'account_id',
          'type',
          'run_rank_by_type'
        ]) }} as unique_id,
        *

    from ranked

)

select * from with_id
