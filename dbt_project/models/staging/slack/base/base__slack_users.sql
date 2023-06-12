with source as (

    select * from {{ source('slack', 'users') }}

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
            {{ case_insensitive_substr('real_name', frequent_pronoun_pairs()) }},
            {{ case_insensitive_substr('display_name', frequent_pronoun_pairs()) }},
            {{ case_insensitive_substr('profile:title', frequent_pronoun_pairs()) }}
        )) as pronouns,
        coalesce(
            {{ case_insensitive_substr('real_name', no_pronoun_pairs()) }},
            {{ case_insensitive_substr('display_name', no_pronoun_pairs()) }},
            regexp_replace(
                {{ case_insensitive_substr('profile:title', at_company(), 3) }},
                '\s*\\({{ unquoted_frequent_pronoun_pairs() }}\\)',
                ''
            )
        ) as company_info,
        team_id,
        two_factor_type,
        tz as timezone,
        tz_label as timezone_label,
        tz_offset as timezone_offset,
        {{ epoch_to_timestamp('updated') }} as updated_at

    from source

)

select * from renamed
