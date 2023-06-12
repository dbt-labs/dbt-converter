with

accounts as (

    select * from {{ ref('stg_salesforce__accounts') }}

),

owners as (

    select * from {{ ref('stg_salesforce__owners') }}

),

contacts as (

    select * from {{ ref('stg_salesforce__contacts') }}

),

opps as (

    select * from {{ ref('stg_salesforce__opportunities') }}

),

cloud_account_mappings as (

    select * from {{ ref('cloud_account_mappings') }}

),

gong_calls as (

    select * from {{ ref('stg_salesforce__gong_calls') }} 

),

account_based_marketing_stages as(

    select * from {{ ref('int_account_based_marketing_stages') }} 

),

crossbeam_partners as(

    select * from {{ ref('int_crossbeam_partners') }} 

),

predicted_cloud_datawarehouse as (

    select * from {{ ref('int_predicted_cloud_datawarehouse') }}

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
        accounts.* exclude (customer_tier, overridden_customer_tier),
        coalesce(
            accounts.overridden_customer_tier,
            accounts.customer_tier
        ) as customer_tier,

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
            {{ dbt_utils.generate_surrogate_key([
                'coalesce(cloud_account_info.customer_id,accounts.account_id)',
                'cloud_account_info.cloud_account_id'
            ]) }} 
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
        crossbeam_partners.partner_customers,
        crossbeam_partners.partner_prospects,
        crossbeam_partners.partner_opportunities,
        predicted_cloud_datawarehouse.predicted_data_warehouse,

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
    left join crossbeam_partners
        on accounts.account_id = crossbeam_partners.account_id
    left join predicted_cloud_datawarehouse
        on accounts.account_id = predicted_cloud_datawarehouse.account_id

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