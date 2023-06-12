with source as (

    select * from raw.fivetran_hubspot.marketing_email_campaign

),

renamed as (

    select
        campaign_id,
        marketing_email_id

    from source

)

select * from renamed