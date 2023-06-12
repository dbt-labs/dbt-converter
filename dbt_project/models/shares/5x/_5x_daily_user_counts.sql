{{
    config(
        schema = 'shared_partner_managed_cloud',
        post_hook = "copy into 's3://external-partner-5x-managed-dbt-cloud-account-usage/'
                     from {{ this }} 
                     storage_integration = partner_5x_managed_dbt_cloud_S3
                     overwrite = true
                     header = true
                     single = true;"
    )
}}

with accounts as (

  select 
        account_id,
        name as account_name
  
  from {{ ref('fct_cloud_accounts') }} 
  where name ilike '%(5x)'

),

activities as (

    select 
        account_id,
        user_id,
        date_day

    from {{ref('fct_cloud_user_account_activities') }}

    where 
        user_license_type = 'developer' 
        and is_user_deleted_from_account = 0 
        and user_id not in ('118120','632', '97640') -- 5x API account, Amy Chen's user
 
), 


account_users_joined as (

  select 
        accounts.account_id,
        accounts.account_name,
        activities.user_id,
        activities.date_day

  from accounts
  left join activities using (account_id)

),

account_dates as (

    select 
        account_id,
        min(date_day) as account_trial_date,
        min(date_day + 14) as account_activated_date
    
    from account_users_joined
    group by 1

),

daily_user_counts as (

    select 
        account_users_joined.account_id,
        account_users_joined.account_name,
        account_users_joined.date_day,
        account_dates.account_trial_date,
        account_dates.account_activated_date,
        sum(case when account_users_joined.date_day < account_activated_date then 1 else 0 end) as trial_users, 
        sum(case when account_users_joined.date_day >= account_activated_date then 1 else 0 end) active_users 
    
    from account_users_joined
    left join account_dates on account_users_joined.account_id = account_dates.account_id
    {{ dbt_utils.group_by(5) }}
    order by 1,2,3,4,5

)

select * from daily_user_counts