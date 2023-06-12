with

coalesce_registrants as (

    select * from {{ ref('fct_bizzabo_registrations') }}
    where event_id = '396530' -- filtered to just Coalesce 2022 for now
        and salesforce_contact_id is not null

),

salesforce_contacts as (

    select * from {{ ref('dim_salesforce_contacts') }}

),

country_map as (

    select * from {{ ref('country_to_region_mappings') }}

),

registrants_expanded as (

    -- Registrant information lives in a JSON column currently
    -- this allows us to access the Country value
    select
        *,
        registrant_properties:country::string as registrant_country_name,
        registrant_properties:what_is_your_role::string as registrant_role
    
    from coalesce_registrants

),

cleaned as (

    select
        *,
        
        -- the below countries need to be renamed to match our country to region mappings
        -- this is because Bizzabo uses ANOTHER country list that doesn't match ISO or Clearbit
        -- we imagine this list will be short
        case
            when registrant_country_name = 'Congo, Democratic Republic of' then 'Congo, the Democratic Republic of the'
            when registrant_country_name = 'North Macedonia' then 'Macedonia, the former Yugoslav Republic of' 
            when registrant_country_name = 'Viet Nam' then 'Vietnam'
            when registrant_country_name = 'Russia' then 'Russian Federation'
            when registrant_country_name = 'Tanzania, the United Republic of' then 'Tanzania, United Republic of'
            when registrant_country_name = 'Hong Kong' then 'China'
            when registrant_country_name = 'United States Minor Outlying Islands' then 'United States'
            else registrant_country_name
        end as registrant_country_mapping
    
    from registrants_expanded

),

country_codes_mapped as (

    select distinct
        cleaned.*,
        country_map.country_code as registrant_country_code
        
    from cleaned
    left join country_map
        on cleaned.registrant_country_mapping = country_map.country_name

),

clearbit_countries_mapped as (

    select
        country_codes_mapped.*,
        coalesce(country_map.country_name,country_codes_mapped.registrant_country_mapping) as registrant_clearbit_country_name
    
    from country_codes_mapped
    left join country_map
        on country_codes_mapped.registrant_country_code = country_map.country_code
        and country_map.data_source = 'clearbit'

),

windowed as (

    select distinct
        salesforce_contact_id,
        last_value(registrant_clearbit_country_name) ignore nulls over (
            partition by salesforce_contact_id
            order by registered_at
        ) as latest_registrant_country_name,

        last_value(registrant_country_code) ignore nulls over (
            partition by salesforce_contact_id
            order by registered_at
        ) as latest_registrant_country_code,

        last_value(registrant_role) ignore nulls over (
            partition by salesforce_contact_id
            order by registered_at
        ) as latest_registrant_role
    
    from clearbit_countries_mapped

),

joined as (

    select
        windowed.salesforce_contact_id,
        
        windowed.latest_registrant_country_name,
        salesforce_contacts.country as salesforce_country_name,

        windowed.latest_registrant_country_code,
        salesforce_contacts.country_code as salesforce_country_code,

        salesforce_contacts.title as salesforce_title,

        windowed.latest_registrant_role,
        salesforce_contacts.role as salesforce_role,

        coalesce(
            salesforce_contacts.title is null,
            false
        ) as is_missing_sfdc_title,

        coalesce(
            salesforce_contacts.role is null,
            false
        ) as is_missing_sfdc_role,

        coalesce(
            salesforce_contacts.country_code is null,
            false
        ) as is_missing_sfdc_country_code,

        coalesce(
            salesforce_contacts.country is null,
            false
        ) as is_missing_sfdc_country_name
    
    from windowed
    left join salesforce_contacts
        on windowed.salesforce_contact_id = salesforce_contacts.contact_id

),

final as (

    select
        *,
        -- the below coalesce statements allow us to default to the SFDC value if present
        -- if not, use the provided value from registration
        coalesce(salesforce_country_name, latest_registrant_country_name) as inferred_country_name,
        coalesce(salesforce_country_code, latest_registrant_country_code) as inferred_country_code,
        coalesce(salesforce_role, latest_registrant_role) as inferred_role,
        coalesce(salesforce_title, latest_registrant_role) as inferred_title
    
    from joined

)

select * from final