with 

source as (

    select * from {{ source('bizzabo', 'sponsors') }}

),

renamed as (

    select
        id as sponsor_id,
        eventid as event_id,

        booth,
        lower(contactemail) as contact_email,
        contactphone as contact_phone,
        description,
        facebook as facebook_url,
        level,
        linkedin as linkedin_url,
        logo,
        name,
        promotedoffer as promoted_offer,
        twitter as twitter_handle,
        type,
        website as website_url,

        visible as is_visible,
        
        created as created_at,
        _sdc_batched_at,
        case
            when _sdc_batched_at::date < (select dateadd('day',-1,max(_sdc_batched_at))::date as _sdc_batched_at_date from source) then true
            else false
        end as is_deleted

    from source

)

select * from renamed