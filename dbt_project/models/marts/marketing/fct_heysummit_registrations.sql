with

registrants as (

    select * from {{ ref('int__coalesce_registrants') }}

),

contacts as (

    select * from {{ ref('stg_salesforce__contacts') }}
    where is_deleted = False

),

accounts as (

    select * from {{ ref('dim_salesforce_accounts') }}

),

region_map as (

    select * from {{ ref('country_to_region_mappings') }}
    -- here we are forcing clearbit data source since registrant will be synced back to Salesforce to enrich contacts
    -- and Salesforce utilizes Clearbit-sourced countries
    where data_source = 'clearbit'

),

registrants_cleaned as (

    select
        {{ dbt_utils.star(from=ref('int__coalesce_registrants'),
            except=[
                'QUESTIONS',
                'TALKS', 
                'CATEGORIES',
                'TICKETS']
        ) }}
    from registrants

),

info_joined as (

    select
        contacts.contact_id,
        contacts.account_id,
        registrants_cleaned.*,

        coalesce(
            contacts.country_code,
            accounts.shipping_country_code,
            accounts.billing_country_code
        ) as country_code

    from registrants_cleaned
    left join contacts using (email)
    left join accounts
        on contacts.account_id = accounts.account_id

),

geo_joined as (

    select
        info_joined.*,
        region_map.country_name,
        region_map.region_category
    
    from info_joined
    left join region_map using (country_code)

)

select * from geo_joined