with

user_info as (

    select * from {{ ref('base__delighted_users') }}

)

select * from user_info
