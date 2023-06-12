
  
    

        create or replace transient table analytics_dev.dbt_jstein.int_web_form_emails  as
        (

with

web_conversions as (

    select * from analytics_dev.dbt_jstein.stg_snowplow_web_events
    where event_name = 'marketing_web_conversions'
        and unstruct_event:data:data:email::string is not null

    

),

form_submits as (

    select * from analytics_dev.dbt_jstein.current_snowplow_submit_form

    

),

form_elements as (

    select * from analytics_dev.dbt_jstein.current_snowplow_submit_form_elements

    

),

form_emails as (

    select
        event_id,
        lower(value) as email

    from form_elements
    where name ilike '%email%'
        and value is not null
        and value != ''
    group by 1,2

),

joined as (

    select
        form_submits.event_id,
        form_submits.form_id,
        form_submits.domain_userid,
        form_submits.user_id as cloud_user_id,
        form_emails.email,
        form_submits.collector_tstamp
 
    from form_submits
    inner join form_emails
        on form_submits.event_id = form_emails.event_id

),

unioned as (

    select * from joined
    union all
    select
        event_id,
        unstruct_event:data:data:id::string as form_id,
        domain_userid,
        user_id as cloud_user_id,
        unstruct_event:data:data:email::string as email,
        collector_tstamp
    
    from web_conversions

)

select * from unioned
        );
      
  