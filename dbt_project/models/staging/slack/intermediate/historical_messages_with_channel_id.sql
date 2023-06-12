with historical_messages as (

    select * from {{ ref('base_slack_historical__messages') }}

),

channels as (

    select * from {{ ref('stg_slack__channels') }}

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'historical_messages.ts',
            'channels.channel_id',
            'historical_messages.channel_name'])
        }} as message_id,

        -- since surrogate_key still returns a value when an input is null,
        -- wrap this in a case statement so that it sometimes returns a null
        case
            when parent_message_sent_at is not null
                then {{ dbt_utils.generate_surrogate_key([
                    'historical_messages.thread_ts',
                    'channels.channel_id',
                    'historical_messages.channel_name'
                ]) }}
        end as parent_message_id,

        channels.channel_id,

        historical_messages.*

    from historical_messages

    left join channels
        on historical_messages.channel_name = channels.name

)

select * from final
