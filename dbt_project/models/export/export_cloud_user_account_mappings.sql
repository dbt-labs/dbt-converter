with

user_account_mappings as (

    select * from {{ ref('fct_cloud_user_account_mappings') }}

)

select * from user_account_mappings

