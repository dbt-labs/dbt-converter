
with invocations as (

    select * from {{ref('fct_dbt_invocations')}}
    where is_completed_invocation

),

calc as (

    select

        *,

        max(dbt_version) over (
            partition by user_id
            order by started_at
            rows between unbounded preceding and current row
            ) as max_dbt_version,

        max(dbt_version) over (
            partition by user_id
            order by started_at
            rows between unbounded preceding and 1 preceding
            ) as prior_max_dbt_version

    from invocations

),

final as (

    select

        prior_max_dbt_version as prior_dbt_version,
        max_dbt_version as new_dbt_version,
        user_id,
        started_at as upgraded_at,
        invocation_id

    from calc

    where max_dbt_version > prior_max_dbt_version

)

select * from final
