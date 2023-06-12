with

users as (

    select * from {{ ref('stg_cloud__users') }}

),

email_verification as (

    select * from {{ ref('stg_cloud__email_verifications') }}

),

verified_users as (

    select
        user_id,
        max(is_verified) as is_verified,
        min(created_at) as first_email_verification_sent_at,
        min(verified_at) as first_verified_at,
        max(verified_at) as last_verified_at

    from email_verification
    group by 1

),

joined as (

    select
        users.*,

        -- the below assumes all single tenant users have been verified
        -- note: the `is_verified` value is a number, 1 = true, and 0 = false
        coalesce(
            case
                when users.database_type = 'single-tenant'
                    then 1
                else verified_users.is_verified
            end,
            0
        ) as is_verified,

        verified_users.first_email_verification_sent_at,
        verified_users.first_verified_at,
        verified_users.last_verified_at

    from users
    left join verified_users
        on users.user_id = verified_users.user_id

)

select * from joined

