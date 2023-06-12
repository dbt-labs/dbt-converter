with

partner_connect_signups as (

    select * from {{ ref('stg_cloud__partner_connect_signups') }}

),

hubspot_contacts as (

    select * from {{ ref('stg_hubspot__contact') }}
    where sign_up_source = 'https://www.getdbt.com/signup/bigquery/'

),

user_account_licenses as (

    select * from {{ ref('int_cloud__user_account_licenses') }}
    where is_account_signup = true

),

cloud_users as (

    select * from {{ ref('int_cloud__users_joined') }}

),

bigquery_signups_joined as (
-- BigQuery partner connect signups occur differently than Snowflake & Databricks
-- these signups are sent directly to the Hubspot contact
-- therefore, we need to join this data to user account licenses to find the account related to the signup

    select
        user_account_licenses.account_id as dbt_cloud_account_id,
        null as partner_connect_signup_id,
        'bigquery' as sign_up_source

    from user_account_licenses
    inner join cloud_users
        on user_account_licenses.user_id = cloud_users.user_id
    inner join hubspot_contacts
        on cloud_users.email = hubspot_contacts.email

),

partner_connect_signups_truncated as (

    select
        dbt_cloud_account_id,
        partner_connect_signup_id,
        sign_up_source

    from partner_connect_signups

),

unioned as (

    select * from bigquery_signups_joined
    union all
    select * from partner_connect_signups_truncated

)

select * from unioned