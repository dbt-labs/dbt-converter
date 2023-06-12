with source as (

    select * from {{ source('caveon', 'exam_deliveries') }}

),

renamed as (

    select
        completed_at,
        created_at,
        nullif(examinee:info:"Candidate ID"::string, '') as candidate_id,
        lower(examinee:info:Email::string) as candidate_email,
        split_part(candidate_email, '@', 2) as candidate_email_domain,
        examinee:info:"First Name"::string as candidate_first_name,
        examinee:info:"Last Name"::string as candidate_last_name,
        examinee:sponsor_id::string as sponsor_id,
        examinee_id,
        exam_id,
        form_id,
        form_version_id,
        id as delivery_id,
        ip_address,
        modified_at,
        passed as is_passed,
        submitted_at,
        case
            when passed 
                then row_number() over (
                    partition by candidate_email, exam_id, passed
                    -- this window function will cause issues if and when we add an additional 
                    -- exam. The accredible window function will need to be updated to 
                    -- include an identifier for the credential itself.
                    order by created_at
                )
            else null
        end as passed_exam_number,
        case 
            when passed
                then {{ dbt_utils.generate_surrogate_key([
                    'candidate_email', 
                    'passed_exam_number'
                ]) }} 
            else 'not_a_passed_exam'
        end as credential_exam_id
        
    from source

)

select * from renamed