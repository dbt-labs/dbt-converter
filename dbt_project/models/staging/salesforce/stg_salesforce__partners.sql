{{
  config(
    materialized = 'table'
  )
}}

with

partners as (

    select * from {{ref('base__salesforce_partners')}}

),

accounts as (

    select * from {{ref('stg_salesforce__accounts')}}

),

users as (

    select * from {{ref('stg_salesforce__users')}}

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
