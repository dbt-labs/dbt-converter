{{
    config(
        materialized = 'incremental',
        unique_key = 'page_view_id',
        snowflake_warehouse = set_warehouse_config('large', 'large')
    )
}}


with

page_views as (

    select * from {{ ref('int_snowplow_page_views') }}

    {% if is_incremental() %}
        where page_view_start >= dateadd(day, -3, (select max(page_view_start) from {{this}}))
    {% endif %}

),

sessions as (

    select * from {{ ref('int_snowplow_sessions') }}

    {% if is_incremental() %}
        where session_start >= dateadd(day, -3, (select max(page_view_start) from {{this}}))
    {% endif %}

),

refreshes as (

    select * from {{ ref('int_cloud_ide_refreshes') }}

),

utm_mappings as (

    select * from {{ ref('fct_notion_channel_mapping') }}
    where is_web_mapping = true
    
),

id_map as (

    select distinct
        session_id,
        inferred_user_id,
        cloud_user_id,
        salesforce_contact_id,
        is_internal_user
    
    from sessions

),

page_views_mapped as (
    --we have a mapping CTE so we can populate multi-tenant
    --database_sources and then do the hashing/enriching joins
    select

        case
            -- this only assigns the cloud database source designation to events
            -- that we are certain are actually coming from multi-tenant cloud
            when page_views.app_id not in ('dbt-docs', 'dbt cloud', 'cloud-ui')
              or page_views.page_url_host = 'cloud.getdbt.com'
                then 'cloud'
            else page_views.database_source
        end as database_source,

        id_map.inferred_user_id,
        id_map.cloud_user_id,
        id_map.salesforce_contact_id,
        id_map.is_internal_user,

        {{ dbt_utils.star(
            from = ref('int_snowplow_page_views'),
            except = ['DATABASE_SOURCE'],
            relation_alias = 'page_views'
        ) }}

    from page_views
    left join id_map
        on page_views.session_id = id_map.session_id

    -- we want to filter out events that we are uncertain about. This puts us
    -- in a position where unmapped single-tenants are not processed instead of
    -- inappropriately processing them as multi-tenant which was the old way.
    where database_source is not null

),

windowed as (

    select
        *,
        row_number() over (
            partition by inferred_user_id, session_id
            order by page_view_start
        ) as session_index,

        row_number() over (
            partition by inferred_user_id
            order by page_view_start
        ) as page_view_index

    from page_views_mapped

),

cloud_fields as (

    select
        page_view_id,
        /*
            Some scary-looking but harmless regexes follow. Big idea here
            is that we want to categorize different types of in-app page
            views for downstream analysis. All of the following have 'or'
            statements here. This is because we swapped url pattern when
            we launched the new UI.
        */

        regexp_like(page_url_fragment,
            '/accounts/[0-9]+/settings/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?settings/account/?.*', 'i'
        ) as _is_account_settings,

        regexp_like(page_url_fragment,
            '/accounts/[0-9]+/projects/[0-9]+/(environments|jobs|runs)/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?deploy/?.*', 'i'
        ) as _is_scheduled_run,

        regexp_like(page_url_fragment,
            '/accounts/[0-9]+/projects(/[0-9]+)?/setup/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?[0-9]+/projects(/[0-9]+)?/setup/?.*', 'i'
        ) as _is_onboarding,

        regexp_like(page_url_fragment,
            '/accounts/[0-9]+/projects/[0-9]+/develop/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?accounts/[0-9]+/projects/[0-9]+/develop/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?develop/?.*', 'i'
        ) as _is_ide,

        regexp_like(page_url_fragment,
            '/profile/?.*', 'i'
        ) or
        regexp_like(page_url_path,
            '.*/?settings/profile/?.*', 'i'
        ) as _is_profile,

        regexp_like(page_url_fragment,
            '/accounts/[0-9]+/projects/[0-9]+/(dashboard|home)/?.*', 'i'
        ) or
        -- this is because we had a '/next/' path when we were beta testing the new UI
        regexp_like(page_url_path,
            '.*/?next/?.*', 'i'
        ) or
        page_url_path = '' as _is_home,

        coalesce(
            regexp_substr(page_url_fragment,
                '/accounts/([0-9]+)/?.*', 1, 1, 'ie', 1
            ),
            regexp_substr(page_url,
                '.*/?accounts/([0-9]+)/?.*', 1, 1, 'ie', 1
            ),
            -- slightly complex logic to account for some paths not having any account_id
            -- this has to be treated in an exclusionary way (i.e. using 'not in') because
            -- there's no good way to know what will preceed the account_id since dropping
            -- the explicit call out in the path
            case 
                when
                    regexp_substr(page_url_path,
                        '([a-z]+)/([0-9]+)', 1, 1, 'ie', 1
                    ) not in ('projects', 'environments', 'jobs', 'runs')
                then
                    regexp_substr(page_url_path,
                        '([a-z]+)/([0-9]+)', 1, 1, 'ie', 2
                    )
                else null
            end
        )::varchar as cloud_account_id,

        coalesce(
            regexp_substr(page_url_fragment,
                '/accounts/([0-9]+)/projects/([0-9]+)/?.*', 1, 1, 'ie', 2
            ),
            regexp_substr(page_url,
                '.*?/([0-9]+)/projects/([0-9]+)/?.*', 1, 1, 'ie', 2
            ),
            -- accounting for profile settings of a specific project
            regexp_substr(page_url,
                '.*?/projects/([0-9]+)/?.*', 1, 1, 'ie', 1
            )
        )::varchar as cloud_project_id,

        case
            when page_url_path ilike '/login%' then 'login'
            when page_url_path ilike '/enterprise-login%' then 'login'
            when page_url_path ilike '/signup%' then 'signup'
            when page_url_path ilike '/accept-invite%' then 'accept invite'
            when page_url_path ilike '/verify-email%' then 'verify email'
            when page_url_path ilike '/no-account%' then 'no account error'
            when page_url_path ilike '/reset-password%' then 'reset password'

            when _is_account_settings then 'account settings'
            when _is_scheduled_run then 'scheduled run'
            when _is_ide then 'ide'
            when _is_profile then 'profile'
            when _is_onboarding then 'onboarding'
            when _is_home then 'home'
            when page_url_path = '/' and page_url_fragment = '' then 'home'

            else 'uncategorized'
        end as cloud_page_type

    from windowed
    where page_url_host = 'cloud.getdbt.com'
      or (
        page_url_host = 'www.getdbt.com' and
        page_url_path ilike '/signup%'
      )
      or (
        database_source != 'cloud'
      )

),

page_views_enriched as (

    select
        -- identifications
        {{ id_hashing(
            original_column_name = 'cloud_account_id'
        ) }},
        {{ id_hashing(
            original_column_name = 'cloud_project_id'
        ) }},

        cloud_fields.cloud_page_type,

        coalesce(refreshes.is_refresh, false) as is_refresh,

        windowed.*

    from windowed
    left join cloud_fields
        on windowed.page_view_id = cloud_fields.page_view_id
    left join refreshes
        on windowed.page_view_id = refreshes.page_view_id

),

parse_marketing_dimensions as (

    select
        *,
        {{dbt_utils.generate_surrogate_key([
            'marketing_medium',
            'marketing_source'
        ])}} as source_mapping_id,
        -- the below macro parses all campaigns/content that include 2 delimiters (which is standard per our nomenclature)
        {{ parse_marketing_dimensions() }}

    from page_views_enriched

),

join_utm_mappings as (

    select 
        parse_marketing_dimensions.*,

        {{ channel_mapping_wildcards(
            medium_column = 'parse_marketing_dimensions.marketing_medium',
            source_column = 'parse_marketing_dimensions.marketing_source',
            channel_column='utm_mappings.channel',
            sub_channel_column = 'utm_mappings.sub_channel',
            team_column = 'utm_mappings.team',
            source_type_column = 'utm_mappings.source_type',
            channel_grouping_column = 'utm_mappings.channel_grouping'
        ) }}

    from parse_marketing_dimensions
    left join utm_mappings
        on parse_marketing_dimensions.source_mapping_id = utm_mappings.source_mapping_id

)

select * from join_utm_mappings
