with

source as (

    select * from raw.fivetran_github.team_membership

),

renamed as (

    select
        md5(cast(coalesce(cast(team_id as TEXT), '') || '-' || coalesce(cast(user_id as TEXT), '') as TEXT)) as team_membership_id,
        team_id,
        user_id

    from source

)

select * from renamed