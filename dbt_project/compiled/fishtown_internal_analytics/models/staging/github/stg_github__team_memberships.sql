with

memberships as (

    select * from analytics_dev.dbt_jstein.base__github_team_memberships

),

teams as (

    select * from analytics_dev.dbt_jstein.stg_github__teams

),

joined as (

    select
       memberships.*,
       teams.team_name

    from memberships
    left join teams
        on memberships.team_id = teams.team_id

)

select * from joined