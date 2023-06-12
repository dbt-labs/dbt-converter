with source as (

    select * from {{ source('mailchimp', 'reports_email_activity') }}

),

renamed as (

  select

    __sdc_primary_key as email_record_id,
    email_id,
    email_address as email,
    campaign_id,
    timestamp as happened_at,
    type as bounce_type,
    action as action_type,
    url as clicked_url

   from source

)

select * from renamed
