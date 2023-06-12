with

account_activities as (

    select * from {{ ref('fct_cloud_account_activities') }}
    where plan ilike any ('team%', 'enterprise%')
    and is_current_paying_account

),

user_activities as (

    select * from {{ ref('fct_cloud_user_account_activities') }}
    where plan ilike any ('team%', 'enterprise%')
    and is_current_paying_account

),

paying_accts as (

    select distinct
        customer_id
    from account_activities

),

accounts_ide as (

    select 
        customer_id,

        sum(
            case when date_day = dateadd(day, -1, current_date())
            then t30d_ide_time_engaged_in_s else 0 end
        ) as t30d_ide_time_engaged_in_s,

    -------T31 to 60d
        sum(
            case when date_day = dateadd(day, -30, current_date())
            then t30d_ide_time_engaged_in_s else 0 end
        ) as prev_t30d_ide_time_engaged_in_s

    from account_activities
    group by 1

),

users_ide as (

    select
        customer_id,

        count(distinct
                case when date_day = dateadd(day, -1, current_date())
                    and t30d_active = 1
                        then email
                end
        ) as cloud_maus,

        count(distinct
                case when date_day = dateadd(day, -31, current_date())
                    and t30d_active = 1
                        then email
                end
        ) as cloud_maus_prev,


        count(distinct
                case when date_day = dateadd(day, -1, current_date())
                    and t30d_ide_active = 1
                        then email
                end
        ) as ide_users_t30d,

        count(distinct
                case when date_day = dateadd(day, -31, current_date())
                    and t30d_ide_active = 1
                        then email
                end
        ) as ide_users_prev,

        count(distinct
                case when date_day >= dateadd(day, -60, current_date())
                    and date_day < dateadd(day, -30, current_date())
                    and is_ide_engaged_for_10min
                        then email
                end
        ) as engaged_ide_users_prev,

        count(distinct
                case when date_day >= dateadd(day, -30, current_date())
                and is_ide_engaged_for_10min
                    then email
                end
        ) as engaged_ide_users_t30d

    from user_activities
    group by 1

),


joined as (

    select
        paying_accts.customer_id,

        accounts_ide.t30d_ide_time_engaged_in_s,
        accounts_ide.prev_t30d_ide_time_engaged_in_s,

        users_ide.cloud_maus,
        users_ide.cloud_maus_prev,
        users_ide.ide_users_prev,
        users_ide.ide_users_t30d,
        users_ide.engaged_ide_users_prev,
        users_ide.engaged_ide_users_t30d

    from paying_accts
    left join accounts_ide
        on paying_accts.customer_id = accounts_ide.customer_id
    left join users_ide
        on paying_accts.customer_id = users_ide.customer_id

),

calcs as (

    select
        joined.*,

        round(
            ((cloud_maus - cloud_maus_prev)/nullif(cloud_maus_prev,0)),
            4
        ) as cloud_maus_pct_change,

        round(
            ((ide_users_t30d - ide_users_prev)/nullif(ide_users_prev,0)),
            4
        ) as ide_users_pct_change,

        round(
            ((engaged_ide_users_t30d - engaged_ide_users_prev)/nullif(engaged_ide_users_prev,0)),
            4
        ) as engaged_ide_users_pct_change

    from joined

)

select * from calcs