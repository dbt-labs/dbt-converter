with source as (

    select * from raw.fivetran_hubspot.form

),

renamed as (

    select
        guid as form_id,
        'hsForm_' || guid as snowplow_form_id,
        portal_id,
        follow_up_id,
        lead_nurturing_campaign_id,
        name,
        action,
        method,
        css_class,
        redirect,
        submit_text,
        notify_recipients,
        created_at,
        updated_at

    from source

)

select * from renamed