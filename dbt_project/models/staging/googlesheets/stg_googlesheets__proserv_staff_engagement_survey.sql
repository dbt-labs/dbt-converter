with source as (

    select * from {{ source('fivetran_googlesheets', 'ps_staff_engagement_survey') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'customer_account_id_from_salesforce_',
            'email_address',
            'engagement_start_date'
        ]) }} as survey_response_id,
        customer_account_id_from_salesforce_ as salesforce_account_id,
        customer_company_name_from_salesforce_ as salesforce_account_name,
        opportunity_line_item_from_salesforce_ as salesforce_opportunity_line_item_id,
        timestamp::timestamp_ltz as submitted_at,
        email_address as employee_email_address,
        how_satisfied_were_you_with_this_engagement_ as ps_staff_consulting_csat,
        tell_us_more_about_why_you_chose_that_rating_ as ps_staff_consulting_csat_explanation,
        what_did_you_enjoy_most_about_working_on_this_engagement_ as most_enjoyable,
        what_did_you_enjoy_least_about_working_on_this_engagement_ as least_enjoyable,
        how_much_value_do_you_believe_this_engagement_delivered_to_the_customer_ as value_score,
        how_interesting_was_this_work_to_you_as_an_analytics_engineer_ as interest_score,
        how_willing_was_the_client_to_adapt_to_dbt_best_practices_ as best_practices_score,
        split(what_was_accomplished_during_the_engagement_check_all_that_apply_, ',') as services_provided,
        engagement_type,
        engagement_start_date,
        engagement_end_date,
        anything_to_add_about_the_client_s_legacy_stack_ as other_comments,
        _fivetran_synced

    from source

)

select * from renamed
