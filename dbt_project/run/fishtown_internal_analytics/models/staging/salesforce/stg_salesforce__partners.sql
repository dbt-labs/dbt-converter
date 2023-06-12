
  create or replace   view analytics_dev.dbt_jstein.stg_salesforce__partners
  
   as (
    with

partners as (

    select * from analytics_dev.dbt_jstein.base__salesforce_partners

),

accounts as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__accounts

),

users as (

    select * from analytics_dev.dbt_jstein.stg__salesforce_users

),

joined as (

    select
        partners.*,
        accounts.account_name,
        accounts.primary_domain, 
        users.name as partner_manager_name

    from partners
    left join accounts
        on partners.account_id = accounts.account_id
    left join users
        on partners.partner_manager_id = users.user_id

)

select * from joined
  );

