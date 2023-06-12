with users as (

    select * from {{ ref('dim_slack_users') }}

)

select * from users