
select 
    {{ dbt_utils.star(from=ref('stg_snowplow_events'), except=["OS_TIMEZONE"]) }},

    {# This logic is temporarily here. When we are ready we need to move this
    logic upstream and rebuild historicals. We will need to rebuild historicals
    with the new s3 single tenant mapping data that will be coming in soon, so 
    for the meantime this is the workaround. We we aim to have this deleted
    within a week. (Written by Andrew Escay on 04-18-2022)  #}
    case os_timezone
        when 'Etc/Unknown' then null
        when 'Unknown/Unknown' then null
        when 'Europe/Saratov' then 'Etc/GMT-4'
        when 'Asia/Atyrau' then 'Etc/GMT-5'
        when 'Asia/Qostanay' then 'Etc/GMT-6'
        when 'Asia/Yangon' then 'Asia/Rangoon'
        when 'Asia/Famagusta' then 'Asia/Nicosia'
        when 'Asia/Calcutt' then 'Asia/Kolkata'
        when 'America/Nuuk' then 'America/Godthab'
        when 'America/Punta_Arenas' then 'America/Santiago'
        when 'America/Ne' then 'America/New_York'
        when 'Asia/SaigonMinh' then 'Asia/Saigon'
        when 'Europe/Kyiv' then 'Europe/Kiev'
        else os_timezone
    end as os_timezone

from {{ref('stg_snowplow_events')}}
where platform = 'web'
    and is_dev_event = false