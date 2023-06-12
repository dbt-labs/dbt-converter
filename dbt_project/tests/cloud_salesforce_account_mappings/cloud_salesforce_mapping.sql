with

sfdc_cloud_mappings as (

    select * from {{ ref('cloud_account_mappings') }}
    where is_primary_cloud_account
    and account_id is not null

),

testing as (

    select
        account_id,
        count(*) as total_main_cloud_accounts
    from sfdc_cloud_mappings
    group by 1
    having total_main_cloud_accounts > 1

)

select * from testing