with connectors as (

    select * from analytics_dev.dbt_jstein.stg_fivetran_log__connectors

),

users as (

    select * from analytics_dev.dbt_jstein.stg_fivetran_log__users

),

joined as (

select
    connector_id,
    name as user_name,
    connector_name,
    'https://fivetran.com/dashboard/connectors/postgres_rds/' || connector_name  as connector_url,
    to_timestamp(connector_created_at) as connector_created_at

 from connectors
 left join users
    on connectors.connecting_user_id = users.user_id
 where connector_type_id = 'postgres_rds'

)

select * from joined