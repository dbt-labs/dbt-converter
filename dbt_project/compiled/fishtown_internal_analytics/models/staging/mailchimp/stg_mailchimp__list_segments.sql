with source as (

    select * from raw.mailchimp_data.list_segments

),

renamed as (

  select

    id as list_segment_id,
    name as list_segment_name,
    list_id,
    member_count,
    type,
    updated_at


   from source

)

select * from renamed