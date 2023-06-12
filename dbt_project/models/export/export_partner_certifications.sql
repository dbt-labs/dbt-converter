with

certifications as (

    select * exclude partner_id
    from {{ ref('fct_certification_exam_deliveries') }}
    where is_passed = true
    and credential_id is not null  -- Joining Caveon and Accredible results in NULL credential_ids when users provide different emails 

),

partners as (

    select * from {{ ref('stg_salesforce__partners') }}

),

-- Flag which partners have multiple records in Salesforce
partners_count as (
    select
        account_id,
        primary_domain,
        count(partner_id) as count_partner_records

    from partners
    group by 1, 2

),

-- Partner IDs for partners with one record, partners with multiple will be manually mapped
partners_unique as (

    select distinct
        partners_count.account_id,
        partners_count.primary_domain,
        case
            when count_partner_records > 1
                then null
            else partners.partner_id
        end as partner_id,
        true as is_partner
    
    from partners_count
    left join partners
        on partners_count.account_id = partners.account_id

),

export as (

    select
        credential_id,  -- Primary external lookup field on SFDC object
        credential_exam_id,
        partners_unique.account_id,
        partner_id as partnership,

        candidate_email,
        candidate_first_name,
        candidate_last_name,
        credential_name,
        exam_name,

        is_active_certification,
        is_passed,
        case
            when partners_unique.account_id is not null
                then true
            else false
        end as is_partner,

        completed_at,
        credential_issued_date,
        credential_expired_date

    from certifications
    left join partners_unique
        on certifications.candidate_email_domain = partners_unique.primary_domain

)

select * from export