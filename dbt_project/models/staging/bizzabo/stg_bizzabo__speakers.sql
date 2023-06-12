with

source as (

    select * from {{ source('bizzabo', 'speakers') }}

),

renamed as (

    select
        id as speaker_id,
        event_id,

        bio,
        blog,
        company,
        country,
        lower(email) as email,
        firstname as first_name,
        lastname as last_name,
        concat(
            firstname,
            ' ',
            lastname
        ) as full_name,
        linkedin as linkedin_url,
        parse_json(photoset) as photo_set,
        prefix,
        title,
        twitterhandle as twitter_handle,
        hidden as is_hidden,
        _sdc_batched_at,
        case
            when _sdc_batched_at::date < (select dateadd('day',-1,max(_sdc_batched_at))::date as _sdc_batched_at_date from source) then true
            else false
        end as is_deleted

    from source

)

select * from renamed