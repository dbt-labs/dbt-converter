

select
    'snowpipe' as _source,

    event_id,
    domain_userid,
    user_id,
    domain_sessionid,
    elements.value:name::string as name,
    elements.value:value::string as value,
    elements.seq as index,
    elements.value:nodeName::string as nodename,
    elements.value:type::string as type,

    collector_tstamp

from analytics_dev.dbt_jstein.current_snowplow_unstruct_event_splitter,
lateral flatten (input => unstruct_event:elements) elements
where event_name = 'submit_form'



    and collector_tstamp >= dateadd(d, -3, current_date)





    and collector_tstamp >= (select max(collector_tstamp) from analytics_dev.dbt_jstein.current_snowplow_submit_form_elements)

