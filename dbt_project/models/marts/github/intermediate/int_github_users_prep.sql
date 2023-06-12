with

users as (

    select * from {{ ref('stg_github__users') }}

),

team_memberships as (

    select * from {{ ref('stg_github__team_memberships') }}

),

teams_agg as (

    select
        user_id,
        listagg(distinct team_name, ', ') within group (order by team_name) as teams

    from team_memberships
    group by 1

),

joined as (

    select
        users.*,
        teams

    from users
    left join teams_agg
        on users.user_id = teams_agg.user_id

)

select * from joined