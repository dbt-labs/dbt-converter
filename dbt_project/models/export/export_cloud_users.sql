with

cloud_users as (

    select * from {{ ref('fct_cloud_users') }}

),

final as (

    select
        *,
        self_service_account_owner_count >= 1 as is_self_service_account_owner

    from cloud_users

)

select * from final