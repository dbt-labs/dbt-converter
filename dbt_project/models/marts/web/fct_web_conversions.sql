with

historical_conversions as (

    select * from {{ ref('int_historical_web_conversions') }}

),

current_conversions as (

    select * from {{ ref('int_current_web_conversions') }} 

),

renamed_conversions as (

    select
        current_conversion_name,
        corrected_conversion_name
    
    from {{ ref('website_conversion_exceptions') }}

),

unioned as (

    select * from historical_conversions
    union all
    select * from current_conversions

),

corrections as (

    select
        unioned.event_id,
        unioned.session_id,
        unioned.page_view_id,
        unioned.inferred_user_id,
        unioned.cloud_user_id,
        unioned.salesforce_contact_id,
        unioned.conversion_id,

        coalesce(
            renamed_conversions.corrected_conversion_name,
            unioned.conversion_name
        ) as conversion_name,

        unioned.conversion_type,
        unioned.unstruct_event,
        unioned.converted_at
    
    from unioned
    left join renamed_conversions
        on unioned.conversion_name = renamed_conversions.current_conversion_name

),

conversions_typed as (

    select
        *,

        -- the below logic parses the first value in the conversion_name nomenclature
        -- for example register_cloud -> register
        split_part(conversion_name,'_',1) as conversion_group,
        unstruct_event:data:data:email::string as email
    
    from corrections
    -- the below qualifier ensures we only pulled the first conversion of its type per session
    -- this helps us avoid duplicate conversions in a session
    qualify row_number() over (partition by session_id, conversion_name order by converted_at) = 1

),

windowed as (

    select 
        *,

        -- the Nth conversion for a given individual
        -- this is useful for exploring a users's first ever conversion
        row_number() over (
                partition by inferred_user_id
                order by converted_at
            ) as conversion_index,

        -- the Nth specific conversion for a given individual
        -- for example, if a user registers for Coalesce for the first time in 2021, value = 1
        -- if the user resgisters for Coalesce again in 2022, value = 2
        row_number() over (
            partition by inferred_user_id, conversion_name
            order by converted_at
        ) as conversion_name_index,

        -- the Nth conversion of its group for a given individual
        -- for example, if a user downloads a piece of content (conversion_group = download) on 1/1/2021, value = 1
        -- if that same user downloads a piece of content on 2/15/2021 (conversion_group = download) then value =2 
        row_number() over (
            partition by inferred_user_id, conversion_group
            order by converted_at
        ) as conversion_group_index

    from conversions_typed

)

select * from windowed
