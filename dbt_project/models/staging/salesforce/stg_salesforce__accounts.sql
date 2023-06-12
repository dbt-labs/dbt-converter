
with accounts as (

    select * from {{ ref('base__salesforce_accounts') }}

),

region_lookup as (

    select * from {{ ref('country_to_region_mappings') }}
    -- here we are forcing clearbit-sourced country names since this is what we utilize in Salesforce
    where data_source = 'clearbit'

),

-- Clearbit contains account enrichment information such as: sector, industry, industry group, etc.
clearbit as (

    select * from {{ ref('stg_salesforce__clearbit') }}
    where is_deleted = false

),

joined as (

    select

        {{ dbt_utils.star(
            from=ref('base__salesforce_accounts'),
            except=["BILLING_COUNTRY"])
        }},

        concat(
            'https://fishtown.lightning.force.com/lightning/r/Account/',
            account_id,
            '/view'
        ) as salesforce_account_url,

        coalesce(
            region_lookup.country_name,
            billing_country
        ) as billing_country,

        region_lookup.region_category as billing_region_category,

        clearbit.clearbit_company_type,
        clearbit.clearbit_industry,
        clearbit.clearbit_industry_group,
        clearbit.clearbit_sector,
        clearbit.clearbit_sub_industry,
        clearbit.clearbit_year_company_founded
        

    from accounts
    left join region_lookup
        on accounts.billing_country_code = region_lookup.country_code
    left join clearbit using (clearbit_id)

)

select * from joined
