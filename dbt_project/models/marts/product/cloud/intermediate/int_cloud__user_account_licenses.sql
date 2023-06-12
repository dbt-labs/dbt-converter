with

user_licenses as (

    select * from {{ ref('stg_cloud__user_licenses') }}

),

windowed as (

    select
        *,

        row_number() over (
            partition by user_id
            order by created_at
        ) as user_license_index,

        row_number() over (
            partition by account_id
            order by created_at
        ) as account_user_license_index,

        case
            when account_user_license_index = 1 then true
            else false
        end as is_account_creator,

        case
            when user_license_index = 1
                and account_user_license_index = 1
                and database_type = 'multi-tenant'
                then true
            else false
        end as is_account_signup

    from user_licenses

)

select * from windowed