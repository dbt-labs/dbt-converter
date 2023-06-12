
with

source as (

    {{ dbt_utils.unpivot(
      relation=source('crowdcast', 'crowdcast_event_attendance'),
      cast_to='varchar',
      exclude=['clicked_cta',
              'email',
              'location',
                'login',
                'name',
                'registered_at',
                'source',
                'username',
                'utm_campaign',
                'utm_medium',
                'utm_source',
                'utm_content',
                'watched_replay',
                '_row',
                '_fivetran_synced'],
      field_name='talk_title',
      value_name='did_attend'
    ) }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'email',
            'talk_title',
        ])}} as id,
        email,
        lower(
          trim(
            replace(
              split_part(
                talk_title,
                'ATTENDED_LIVE_',
                -1),
                '_',
                ' '
            )
          )
        ) as talk_name,
        max(did_attend) = 'yes' as did_attend,
        max(clicked_cta) = 'yes' as did_click_cta,
        max(watched_replay) = 'Yes' as did_watch_replay

    from source

    {{ dbt_utils.group_by(3) }}

)

select * from renamed