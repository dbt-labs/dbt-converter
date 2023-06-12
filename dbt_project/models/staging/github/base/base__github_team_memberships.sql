with

source as (

    select * from {{ source('fivetran_github', 'team_membership') }}

),

renamed as (

    select
        {{dbt_utils.generate_surrogate_key([
            'team_id',
            'user_id'
        ])}} as team_membership_id,
        team_id,
        user_id

    from source

)

select * from renamed