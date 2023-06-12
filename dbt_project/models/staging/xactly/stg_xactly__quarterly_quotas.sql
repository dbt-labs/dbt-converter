with

source as (

    select * from {{ source('xactly', 'quotas') }}
    -- Quotas at the quarterly grain only
    where period_type_id = 3276756176

),

final as (

    select
        trim(
            replace(split(participant_name, '(')[1], ')', '')
        ) as salesforce_user_id,

        trim(split(participant_name, '(')[0]) as participant_name,
        title_name,
        role,
        name,
        amount,

        start_date::date as period_started_at

    from source

)

select * from final