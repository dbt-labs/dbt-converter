with

web_attribution as (

    select * from {{ ref('fct_web_attribution_sessions') }}

),

user_account_mappings as (

    select * from {{ ref('int_cloud__user_account_licenses') }}
    where is_account_signup = true
    
),

first_touch as (

    select
        *,
        'First Touch' as attribution_model
    from web_attribution
    where first_touch_points = 1

),

last_touch as (

    select
        *,
        'Last Touch' as attribution_model
    from web_attribution
    where last_touch_points = 1

),

linear as (

    select
        *,
        'Linear' as attribution_model
    
    from web_attribution
    where linear_points > 0

),

forty_twenty_forty as (

    select
        *,
        'Forty Twenty Forty' as attribution_model
    
    from web_attribution
    where forty_twenty_forty_points > 0

),

unioned as (

    select * from first_touch
    union all
    select * from last_touch
    union all
    select * from linear
    union all
    select * from forty_twenty_forty

),

-- the below logic joins a users `register_cloud` conversion to their Cloud Account signup, if it happened after the conversion
-- this ensures we only map Cloud accounts to signup conversions it's a net new user & account
joined as (

    select
        unioned.*,
        user_account_mappings.account_id as cloud_account_id,
        user_account_mappings.created_at as cloud_account_created_at
    
    from unioned
    left join user_account_mappings
        on unioned.inferred_user_id = user_account_mappings.user_id
        -- the below conversion is required until we unify all of our timestamps
        and convert_timezone('UTC',unioned.converted_at::timestamp_tz) <= user_account_mappings.created_at
        and unioned.conversion_name = 'register_cloud'
        and unioned.conversion_name_index = 1

),

calcs as (

    select
        *,
        datediff(day, converted_at, cloud_account_created_at) as days_from_conversion_to_account_creation

    from joined

),

with_id as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'attributed_session_id',
            'attribution_model'
        ])}} as attributed_conversion_id,
        *
    
    from calcs

)

select * from with_id
