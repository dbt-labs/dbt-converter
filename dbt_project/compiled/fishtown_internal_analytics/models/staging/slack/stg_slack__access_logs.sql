with source as (

    select * from raw.slack.access_logs

),

renamed as (

    select
        -- ids
        md5(cast(coalesce(cast(user_id as TEXT), '') || '-' || coalesce(cast(ip as TEXT), '') || '-' || coalesce(cast(user_agent as TEXT), '') as TEXT)) as id,
        user_id,

        count,
        country,
        
    dateadd(seconds, date_first, '1970-01-01')
 as start_at,
        
    dateadd(seconds, date_last, '1970-01-01')
 as end_at,
        ip as ip_address,
        isp,
        region,
        username,
        user_agent

    from source

)

select * from renamed