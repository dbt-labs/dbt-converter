
  
    

        create or replace transient table analytics_dev.dbt_jstein.dim_salesforce_accounts  as
        (

with

accounts as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__accounts

),

owners as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__owners

),

contacts as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__contacts

),

opps as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__opportunities

),

cloud_account_mappings as (

    select * from analytics_dev.dbt_jstein.cloud_account_mappings

),

gong_calls as (

    select * from analytics_dev.dbt_jstein.stg_salesforce__gong_calls 

),

account_based_marketing_stages as(

    select * from analytics_dev.dbt_jstein.int_account_based_marketing_stages 

),

gong_calls_agg as (

    select 
        primary_account_id,
        min(call_start_at)::date as first_kickoff_call_date

    from gong_calls
    where call_name ilike '%kick%off%' 
    group by 1 

),

business_case_video as (

    select distinct
        account_id,
        last_value(business_case_overview_video_url) ignore nulls over (
            partition by account_id
            order by created_at
        ) as business_case_overview_video_url

  from opps

),

cloud_account_info as (

    select
        account_id as cloud_account_id,
        stripe_customer_id,
        salesforce_account_id,
        billing_account_id,
        customer_id,
        customer_name,
        customer_id_type,
        is_primary_cloud_account,
        count(cloud_account_id) over (
            partition by salesforce_account_id
        ) as total_cloud_accounts,
        count(case when is_account_deleted = false then cloud_account_id end) over (
            partition by salesforce_account_id
        ) as total_active_cloud_accounts

    from cloud_account_mappings

),

joined as (

    select
        accounts.*,

        cloud_account_info.cloud_account_id as primary_cloud_account_id,
        cloud_account_info.stripe_customer_id,
        cloud_account_info.total_cloud_accounts,
        cloud_account_info.total_active_cloud_accounts,

        coalesce(
            cloud_account_info.customer_id,
            accounts.account_id
        ) as customer_id,
        coalesce(
            cloud_account_info.customer_name,
            accounts.account_name
        ) as customer_name,
        coalesce(
            cloud_account_info.customer_id_type,
            'salesforce_account_id - missing from cloud_account_mappings'
        ) as customer_id_type,
        coalesce(
            cloud_account_info.billing_account_id,
            
    
md5(cast(coalesce(cast(coalesce(cloud_account_info.customer_id,accounts.account_id) as TEXT), '') || '-' || coalesce(cast(cloud_account_info.cloud_account_id as TEXT), '') as TEXT)) 
        ) as billing_account_id,
            --A billing account is a discrete method by which a customer is
            --paying for a cloud account. This facilitates aggregation to the 
            --customer, organization, and persons grains
            -- See more: https://www.notion.so/dbtlabs/Billing-Accounts-b0c33a62f6ed4638aeaf2baeed982282

        tech_contacts.name as client_technical_contact_name,
        tech_contacts.email as client_technical_contact_email,
        owners.owner_name,
        tech_owners.owner_name as technical_lead,
        business_case_video.business_case_overview_video_url,

        opps.won_at as became_customer_on,
        gong_calls_agg.first_kickoff_call_date,
        account_based_marketing_stages.abm_stage,

        case 
            when accounts.number_of_employees < 1000
                and accounts.clearbit_year_company_founded < 2001
                then 'Small Legacy'
            when accounts.number_of_employees >= 1000
                and accounts.clearbit_year_company_founded < 2001
                then 'Large Legacy'
            when accounts.number_of_employees < 1000
                and accounts.clearbit_year_company_founded >= 2001
                then 'Small Digital Native'
            when accounts.number_of_employees >= 1000
                and accounts.clearbit_year_company_founded >= 2001
                then 'Large Digital Native'
            else 'No Data to Assign Segmentation'
        end as account_segmentation

    from accounts
    left join contacts as tech_contacts
        on accounts.client_technical_contact_id = tech_contacts.contact_id
    left join owners
        on accounts.account_owner_id = owners.owner_id
    left join owners as tech_owners
        on accounts.technical_lead_id = tech_owners.owner_id
    left join opps
        on accounts.first_subscription_opportunity = opps.opportunity_id
    left join gong_calls_agg
        on accounts.account_id = gong_calls_agg.primary_account_id
    left join business_case_video
        on accounts.account_id = business_case_video.account_id
    left join cloud_account_info
        on accounts.account_id = cloud_account_info.salesforce_account_id
        and cloud_account_info.is_primary_cloud_account
    left join account_based_marketing_stages
        on accounts.account_id = account_based_marketing_stages.account_id

),

enriched as (

    select
        *,
        case
            when account_status = 'Customer'
                then datediff(
                        'days',
                        current_date(), 
                        current_term_end)
            else null
        end as days_to_renewal

    from joined

)

select * from enriched
        );
      
  