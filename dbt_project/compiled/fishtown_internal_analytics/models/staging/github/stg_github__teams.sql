with

source as (

    select * from raw.fivetran_github.team

),

renamed as (

    select
        id as team_id,
        org_id,
        parent_id,
        name as team_name,
        slug,
        description,
        privacy

    from source

)

select * from renamed