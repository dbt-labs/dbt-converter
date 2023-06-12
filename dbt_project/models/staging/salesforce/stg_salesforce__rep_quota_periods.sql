{{
  config(
    materialized = 'table'
  )
}}

with

source as (

    select * from {{ source('salesforce', 'rep_quota_periods') }}

),

renamed as (

    select

        id as rep_quota_period_id,
        commission_period__c as commission_period_id,

        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        salesperson_id__c as sales_person_id,
        salesperson_userid__c as sales_person_user_id,

        name as rep_quota_period,
        sales_person_name__c as sales_person_name,
        sales_person_role__c as sales_person_role,

        commission_period_end_date__c as commission_period_end_date,
        commission_period_start_date__c as commission_period_start_date,

        new_arr_quota__c as new_arr_quota,
        renewal_quota__c as renewal_quota,
        total_quota__c as total_quota,
        fully_ramped_quota_no_churn_disc__c as fully_ramped_quota_no_churn_disc,
        ramping_quota_no_churn_discount__c as ramping_quota_no_churn_disc,
        
        total_delta_arr__c as total_delta_arr,
        total_rep_delta_arr__c as total_rep_delta_arr,
        total_commissionable_arr__c as total_commissionable_arr,

        total_services_revenue__c as total_services_revenue,
        of_opp_commissions__c as total_opp_commissions,

        systemmodstamp as system_modstamp,
        lastmodifieddate as last_modified_date,
        createddate as created_at

    from source
    where isdeleted = false

)

select * from renamed