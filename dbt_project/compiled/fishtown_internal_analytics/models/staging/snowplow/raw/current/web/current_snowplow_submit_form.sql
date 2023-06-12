

select
    'snowpipe' as _source,
    event_id,
    domain_userid,
    user_id,
    domain_sessionid,
    unstruct_event:formId::string as form_id,
    collector_tstamp

from analytics_dev.dbt_jstein.current_snowplow_unstruct_event_splitter
where event_name = 'submit_form'



    and collector_tstamp >= dateadd(d, -3, current_date)





    and collector_tstamp >= (select max(collector_tstamp) from analytics_dev.dbt_jstein.current_snowplow_submit_form)

