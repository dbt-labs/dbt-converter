with 

source as (

    select * from {{ source('bizzabo', 'events') }}

),

renamed as (

    select
        id as event_id,

        attendancetype as attendance_type,
        headerlogourl as header_logo_url,
        language,
        name,
        status,
        supportemail as support_email,
        timezone,
        array_to_string(type, ', ') as type,
        websiteurl as website_url,
        
        created as created_at,
        modified as modified_at,
        startdate as start_at,
        enddate as end_at,
        _sdc_batched_at

    from source

)

select * from renamed