with

source as (

    

),

renamed as (

    select
        md5(cast(coalesce(cast(email as TEXT), '') || '-' || coalesce(cast(talk_title as TEXT), '') as TEXT)) as id,
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

    group by 1,2,3

)

select * from renamed