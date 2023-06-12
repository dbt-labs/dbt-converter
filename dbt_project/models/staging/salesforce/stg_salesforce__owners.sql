
with source as (

    select * from {{ ref('stg_salesforce__users') }}

),

renamed as (

    select
    
        user_id as owner_id,
        name as owner_name,
        first_name as owner_first_name,
        last_name as owner_last_name, 
        email,
        username,
        title,
        user_type,
        community_nickname,
        user_role as role_name,

        case
            when role_name = 'Sales Director' then 'SD'
            when role_name = 'Regional Director of Sales' then 'SD'
            when role_name = 'Sales Development Rep' then 'SDR'
            when role_name = 'Solutions Architect' then 'SA'
            when role_name = 'Regional Director of Solutions Architecture' then 'SA'
            when role_name = 'Head of Solutions Architecture' then 'SA'
        end as owner_role_grouping

    from source

)

select * from renamed