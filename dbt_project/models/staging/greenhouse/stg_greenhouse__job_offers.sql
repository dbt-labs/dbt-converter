with

source as (

    select * from {{ source('greenhouse', 'offer') }}
    where _fivetran_deleted = false

),

final as (

    select 
        id as offer_id,
        application_id,
        custom_position_title as position_title,
        custom_position_level as position_level,
        custom_employment_type as employment_type,
        custom_candidate_name as candidate_name,
        custom_employee_associate_id_internal_candidate_only_ as internal_applicant_worker_id,
        custom_hiring_manager:name::string as hiring_manager,
        custom_hiring_manager:email :: string as hiring_manager_email,
        trim(custom_country,'[ "" ]') as location_country,
        custom_state_territory as location_state,
        custom_city as location_city,
        custom_salary:value::int as salary,
        custom_salary:unit::string as salary_currency,
        custom_equity_stake as equity_amount,
        custom_signing_bonus_amount_offer_1666727470_3459742:value::int as signing_bonus_amount,
        custom_signing_bonus_amount_offer_1666727470_3459742:unit::string as signing_bonus_currency,
        custom_commission_amount:value::int as commission_amount,
        custom_commission_amount:unit::string as commission_currency,
        created_at,
        updated_at,
        sent_at,
        resolved_at,
        custom_offer_expiration_date as expiration_date,
        status as offer_status,
        starts_at as start_date,
        version as offer_version
        
    from source

)

select * from final