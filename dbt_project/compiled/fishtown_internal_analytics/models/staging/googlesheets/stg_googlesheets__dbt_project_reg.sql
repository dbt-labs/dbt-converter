with

source as (

    select * from raw.fivetran_googlesheets.historical_dbt_project_registration

),

renamed as (

    select
        _row as id,
        
        --partner information
    
        what_company_do_you_work_for_ as partner_name,
        
        what_type_of_project_are_you_registering_ as project_registration_type,
        email_address,

        --project information 

        client_company_name,
        client_company_website,
        contact_person_at_the_client_company,
        email_address_of_client_contact,
        when_did_this_engagement_begin_ as engagement_start_date,
        when_did_this_engagement_end_or_do_you_expect_it_to_end_ as engagement_end_date,
        please_briefly_describe_this_project_3_5_sentences_ as project_details, 
        do_you_give_fishtown_analytics_permission_to_contact_this_client_to_ask_about_their_satisfaction_with_your_work_ as is_reference,
        
        "TIMESTAMP" as registered_at,
        _fivetran_synced

    from source

),

filtered as (
    
    select * from renamed 
    where partner_name != 'SnowcatCloud'
)

select * from renamed