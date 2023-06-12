{{
    config(
        materialized = 'incremental',
        unique_key= 'session_id'
    )
}}

with sessions as (

    select
        {{ dbt_utils.star(ref('int_snowplow_sessions'), except=[
            'USER_CUSTOM_ID'
        ]) }}
    
    from {{ ref('int_snowplow_sessions') }}
    
    {% if is_incremental() %}
        where session_start >= dateadd(day, -3, (select max(session_start) from {{this}}))
    {% endif %}

),

signup_attempts as (

    select * from {{ref('current_snowplow_submit_form')}}
    where form_id = 'signup'

    {% if is_incremental() %}
        and _loaded_at >= dateadd(day, -3, (select max(first_signup_activity_loaded_at) from {{this}}))
    {% endif %}

),

region_lookup as (

    select * from {{ ref('country_to_region_mappings') }}

),

web_experiments as (

    select * from {{ ref('int_web_experiment_sessions') }}

),

utm_mappings as (

    select * from {{ ref('fct_notion_channel_mapping') }}
    where is_web_mapping = true

),

sales_territories as (

    select * from {{ ref('int_salesforce__territory_mappings') }}

),

salesforce_contacts as (

    select * from {{ ref('stg_salesforce__contacts') }}
    where is_deleted = false

),

salesforce_accounts as (

    select * from {{ ref('stg_salesforce__accounts') }}
    where is_deleted = false

),

zipcode_territories as (

    select
        zipcode,
        territory_name
    
    from sales_territories
    where zipcode is not null
        and territory_id is not null
    group by 1,2

),

state_territories as (

    select
        state_province,
        territory_name
    
    from sales_territories
    where state_province is not null
        and zipcode is null
        and territory_id is not null
    group by 1,2

),

country_territories as (

    select
        country_code,
        territory_name
    
    from sales_territories
    where country_code is not null
        and state_province is null
        and zipcode is null
        and territory_id is not null
    group by 1,2

),

unique_regions as (

  select distinct
      country_code,
      region_category

  from region_lookup

),

signup_session_ids as (

    select distinct
        domain_sessionid as session_id,
        min(_loaded_at) as first_signup_activity_loaded_at
    from signup_attempts
    group by 1

),

sessions_enriched as (

    select
        sessions.*,

        case
            when signup_session_ids.session_id is not null
                then true
            else false
        end as user_attempted_signup,

        signup_session_ids.first_signup_activity_loaded_at,
        unique_regions.region_category,

        --experiments
        web_experiments.experiment_name,
        web_experiments.branch_name,

        coalesce(
            zipcode_territories.territory_name,
            state_territories.territory_name,
            country_territories.territory_name
        ) as sales_territory,

        salesforce_contacts.account_id as salesforce_account_id,
        salesforce_accounts.market_segment as market_segment
    
    from sessions
    left join signup_session_ids
        on sessions.session_id = signup_session_ids.session_id
    left join unique_regions
        on sessions.geo_country = unique_regions.country_code
    left join web_experiments
        on sessions.session_id = web_experiments.session_id
    left join zipcode_territories
        on sessions.geo_zipcode = zipcode_territories.zipcode
    left join state_territories
        on sessions.geo_region_name = state_territories.state_province
        and zipcode_territories.territory_name is null
    left join country_territories
        on sessions.geo_country = country_territories.country_code
        and zipcode_territories.territory_name is null
        and state_territories.territory_name is null
    left join salesforce_contacts
        on sessions.salesforce_contact_id = salesforce_contacts.contact_id
    left join salesforce_accounts
        on salesforce_contacts.account_id = salesforce_accounts.account_id

),

parse_marketing_dimensions as (

    select
        *,
        -- the below macro parses all campaigns/content that include 2 delimiters (which is standard per our nomenclature)
        {{ parse_marketing_dimensions() }}

    from sessions_enriched

),

with_utm_mapping_id as (

    select 
        *,
        {{dbt_utils.generate_surrogate_key([
            'marketing_source',
            'marketing_medium'
        ])}} as source_mapping_id,
        {{ dbt_utils.generate_surrogate_key(['marketing_campaign']) }} as campaign_id
    from parse_marketing_dimensions

),

join_utm_mappings as (

    select 
        with_utm_mapping_id.*,

        {{ channel_mapping_wildcards(
            medium_column = 'with_utm_mapping_id.marketing_medium',
            source_column = 'with_utm_mapping_id.marketing_source',
            channel_column='utm_mappings.channel',
            sub_channel_column = 'utm_mappings.sub_channel',
            team_column = 'utm_mappings.team',
            source_type_column = 'utm_mappings.source_type',
            channel_grouping_column = 'utm_mappings.channel_grouping'
        ) }},

        replace(replace(marketing_campaign,'%20',' '),'+',' ') marketing_campaign_with_spaces,
        date(session_start) session_start_date

    from with_utm_mapping_id
    left join utm_mappings
        on with_utm_mapping_id.source_mapping_id = utm_mappings.source_mapping_id

),

campaign_replacements as (

    select
        * exclude (marketing_campaign_with_spaces),

        -- the below replacements are required since our agency placed different names in the UTM parameters
        -- versus what they had in the actual ad names
        -- TO DO: devleop a more robust campaign name replacement mechanism - this is a short term solution
        case
            when marketing_campaign_with_spaces = 'dbt - brand - us - dc' then 'dbt - brand - dc'
            when marketing_campaign_with_spaces = 'dbt - nonbranded - us - dc' then 'dbt - non-branded - us - dc'
            else marketing_campaign_with_spaces
        end as marketing_campaign_with_spaces

    from join_utm_mappings

),

with_ad_mapping_id as (

    select 
        *,       
        {{dbt_utils.generate_surrogate_key([
            'marketing_campaign_with_spaces',
            'sub_channel',
            'session_start_date'
        ])}} as ad_web_mapping_id
    from campaign_replacements
)

select * from with_ad_mapping_id
