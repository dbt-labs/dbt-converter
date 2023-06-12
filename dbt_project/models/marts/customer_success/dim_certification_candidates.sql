with

certification_exam_deliveries as (

    select * from {{ ref('fct_certification_exam_deliveries') }}

),

final as (

    select
        candidate_email,
        candidate_email_domain,
        max(partner_id) as partner_id,
        count(*) as total_developer_cert_attempts,
        max(is_passed) as has_passed_developer_cert,
        coalesce(max(is_active_certification), false)
            as has_active_developer_cert,
        max(credential_expired_date) as developer_cert_credential_expired_date

    from certification_exam_deliveries
    where exam_name = 'dbt Analytics Engineering Certification Exam'
    group by 1,2

)

select * from final