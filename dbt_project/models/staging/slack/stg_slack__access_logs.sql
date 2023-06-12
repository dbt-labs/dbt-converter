with source as (

    select * from {{ source('slack', 'access_logs') }}

),

renamed as (

    select
        -- ids
        {{ dbt_utils.generate_surrogate_key(['user_id', 'ip', 'user_agent']) }} as id,
        user_id,

        count,
        country,
        {{ epoch_to_timestamp('date_first') }} as start_at,
        {{ epoch_to_timestamp('date_last') }} as end_at,
        ip as ip_address,
        isp,
        region,
        username,
        user_agent

    from source

)

select * from renamed
