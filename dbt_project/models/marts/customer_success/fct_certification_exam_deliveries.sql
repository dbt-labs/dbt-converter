{{
  config(
    materialized = "view"
  )
}}

with exams as (

    select * from {{ ref('stg_caveon__exams') }}

),

exam_deliveries as (

    select * from {{ ref('stg_caveon__exam_deliveries') }}

),

accredible_developer_credentials as (
    
    select * from {{ ref('stg_accredible__credentials') }}
    where credential_group_name = 'dbt Developer'

),

salesforce_credentials as (

    select * from {{ ref('stg_salesforce__credentials') }}

),

final as (

    select
        exam_deliveries.delivery_id,
        exam_deliveries.credential_exam_id,
        accredible_developer_credentials.credential_id,
        salesforce_credentials.partner_id,
        exam_deliveries.candidate_email,
        exam_deliveries.candidate_email_domain,
        exam_deliveries.candidate_first_name,
        exam_deliveries.candidate_last_name,
        exams.exam_name,
        exam_deliveries.is_passed,
        accredible_developer_credentials.credential_group_name as credential_name,
        accredible_developer_credentials.is_active_certification,
        accredible_developer_credentials.credential_issued_date,
        accredible_developer_credentials.credential_expired_date,
        exam_deliveries.completed_at

    from exam_deliveries
    left join exams
        on exam_deliveries.exam_id = exams.exam_id
    -- one note on this join 
    -- developers like Elize or Bennie who made the exam have credentials
    -- but never sat through the exam through caveon, and will be excluded here
    left join accredible_developer_credentials
        on exam_deliveries.credential_exam_id = accredible_developer_credentials.credential_exam_id
    left join salesforce_credentials
        on exam_deliveries.credential_exam_id = salesforce_credentials.credential_exam_id

)

select * from final