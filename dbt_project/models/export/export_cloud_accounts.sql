with cloud_accounts as (

    select * from {{ ref('fct_cloud_accounts') }}

)

select * from cloud_accounts