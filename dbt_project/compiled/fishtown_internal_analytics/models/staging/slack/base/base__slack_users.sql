with source as (

    select * from raw.slack.users

),

renamed as (

    select
        id as user_id,
        lower(profile:email::text) as email,

        color,
        deleted,
        has_2fa,

        is_admin,
        is_app_user,
        is_bot,

        -- remapping this to a more sensible field
        case
            -- handle text nature of this column
            when is_invited_user = 'True' then false
            else true
        end as has_joined_workspace,

        is_owner,
        is_primary_owner,
        is_restricted,
        is_ultra_restricted,
        name,
        profile,
        real_name,
        trim(profile:display_name, '"') as display_name,
        lower(coalesce(
            
    REGEXP_SUBSTR(real_name, '(he/him|she/her|they/them|he/they|she/they)', 1, 1, 'ie', 1)
,
            
    REGEXP_SUBSTR(display_name, '(he/him|she/her|they/them|he/they|she/they)', 1, 1, 'ie', 1)
,
            
    REGEXP_SUBSTR(profile:title, '(he/him|she/her|they/them|he/they|she/they)', 1, 1, 'ie', 1)

        )) as pronouns,
        coalesce(
            
    REGEXP_SUBSTR(real_name, '\\(([^/]*)\\)', 1, 1, 'ie', 1)
,
            
    REGEXP_SUBSTR(display_name, '\\(([^/]*)\\)', 1, 1, 'ie', 1)
,
            regexp_replace(
                
    REGEXP_SUBSTR(profile:title, '(@|(at )|\\||- |for )\\s*(.+)', 1, 1, 'ie', 3)
,
                '\s*\\(he/him|she/her|they/them|he/they|she/they\\)',
                ''
            )
        ) as company_info,
        team_id,
        two_factor_type,
        tz as timezone,
        tz_label as timezone_label,
        tz_offset as timezone_offset,
        
    dateadd(seconds, updated, '1970-01-01')
 as updated_at

    from source

)

select * from renamed