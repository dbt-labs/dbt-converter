with

account_domains_ranked as (

    select * from {{ ref('int_account_domains__ranked') }}

),

single_tenant_rankings as (

    select distinct
        email_domain,
        account_id,
        salesforce_account_id,
        salesforce_account_name,
        
        row_number() over (
            partition by account_id
            order by count_of_users desc, last_license_created_at desc 
        ) as single_tenant_domain_user_rank,

        max(override_sfdc_account_id) over (
            partition by account_id
        ) as account_level_override_sfdc_account_id,

        max(override_sfdc_account_name) over (
            partition by account_id
        ) as account_level_override_sfdc_account_name,

        max(is_account_override) over (
            partition by account_id
            order by is_account_override desc nulls last
        ) as is_single_tenant_account_override

        

    from account_domains_ranked
    {# qualify row_number() over (partition by database_source order by count_of_users desc, last_license_created_at desc) = 1 #}

),

step_1 as (

    select
        account_id,
        override_sfdc_account_id as salesforce_account_id,
        cloud_account_name,
        override_sfdc_account_name as salesforce_account_name,
        array_agg(email_domain)::string as email_domain,
        'Very High' as mapping_confidence,
        'Step 1 - Manual Override' as mapping_step,
        1 as mapping_step_index

    from account_domains_ranked
    where database_type = 'multi-tenant'
        and is_account_override = true
    group by 1,2,3,4,6,7,8

    union all

    -- since single tenant overrides are done at the database source level, this aggregation is different than multi-tenant
    -- the below logic applys the overridden SFDC account ID & account name to all accounts in the database source
    select
        account_domains_ranked.account_id,
        single_tenant_rankings.account_level_override_sfdc_account_id as salesforce_account_id,
        account_domains_ranked.cloud_account_name,
        single_tenant_rankings.account_level_override_sfdc_account_name as salesforce_account_name,
        array_agg(distinct account_domains_ranked.email_domain)::string as email_domain,
        'Very High' as mapping_confidence,
        'Step 1 - Manual Override' as mapping_step,
        1 as mapping_step_index

    from account_domains_ranked
    left join single_tenant_rankings
        on account_domains_ranked.account_id = single_tenant_rankings.account_id
    where account_domains_ranked.database_type = 'single-tenant'
        and single_tenant_rankings.is_single_tenant_account_override = true
    group by 1,2,3,4,6,7,8

),

step_2 as (

    select distinct
        account_domains_ranked.account_id,
        single_tenant_rankings.salesforce_account_id,
        account_domains_ranked.cloud_account_name,
        single_tenant_rankings.salesforce_account_name,
        single_tenant_rankings.email_domain,
        'High' as mapping_confidence,
        'Step 2 - Leading single tenant domain by instance' as mapping_step,
        2 as mapping_step_index
    
    from account_domains_ranked
    left join single_tenant_rankings
        on account_domains_ranked.account_id = single_tenant_rankings.account_id
    where account_domains_ranked.database_type = 'single-tenant'
        and single_tenant_rankings.is_single_tenant_account_override = false
        and single_tenant_rankings.single_tenant_domain_user_rank = 1

),

step_3 as (

    select
        account_id,
        salesforce_account_id,
        cloud_account_name,
        salesforce_account_name,
        email_domain,
        'High' as mapping_confidence,
        'Step 3 - Prioritize customer domain' as mapping_step,
        3 as mapping_step_index
    
    from account_domains_ranked
    where database_type = 'multi-tenant'
        and is_account_override = false
        and account_level_is_managed_customer = true
    qualify row_number() over (partition by account_id order by is_managed_customer desc nulls last, count_of_business_domain_users desc) = 1

),

step_4 as (

    select
        account_id,
        salesforce_account_id,
        cloud_account_name,
        salesforce_account_name,
        email_domain,
        'High' as mapping_confidence,
        'Step 4 - Leading business domain' as mapping_step,
        4 as mapping_step_index
    
    from account_domains_ranked
    where database_type = 'multi-tenant'
        and is_account_override = false
        and account_level_is_managed_customer = false
        and account_level_business_domain_users > 0
        and business_domain_rank = 1
        and count_of_leading_business_domains = 1

),

step_5 as (

    select
        account_id,
        salesforce_account_id,
        cloud_account_name,
        salesforce_account_name,
        billing_email_domain as email_domain,
        'High' as mapping_confidence,
        'Step 5 - Tied business domain, rely on billing domain matches' as mapping_step,
        5 as mapping_step_index

    from account_domains_ranked
    where database_type = 'multi-tenant'
        and is_account_override = false
        and account_level_is_managed_customer = false
        and account_level_business_domain_users > 0
        and count_of_leading_business_domains > 1
        and account_level_billing_domain_match = true
        and is_billing_domain = true

),

step_6 as (

    select
        account_id,
        salesforce_account_id,
        cloud_account_name,
        salesforce_account_name,
        email_domain,
        'Moderate' as mapping_confidence,
        'Step 6 - Billing domain doesnt match leading domain, default to last license created domain' as mapping_step,
        6 as mapping_step_index
    
    from account_domains_ranked
    where database_type = 'multi-tenant'
        and is_account_override = false
        and account_level_is_managed_customer = false
        and account_level_business_domain_users > 0
        and business_domain_rank = 1
        and count_of_leading_business_domains > 1
        and account_level_billing_domain_match = false
        and business_domain_created_at_rank = 1

),

step_7 as (

    select
        account_id,
        salesforce_account_id,
        cloud_account_name,
        salesforce_account_name,
        email_domain,
        'High' as mapping_confidence,
        'Step 7 - Leading partner domain' as mapping_step,
        7 as mapping_step_index
    
    from account_domains_ranked
    where database_type = 'multi-tenant'
        and is_account_override = false
        and account_level_is_managed_customer = false
        and account_level_business_domain_users = 0
        and account_level_partner_domain_users > 0
        and partner_domain_rank = 1
        and count_of_leading_partner_domains = 1

),

step_8 as (

    select
        account_id,
        salesforce_account_id,
        cloud_account_name,
        salesforce_account_name,
        email_domain,
        'Moderate' as mapping_confidence,
        'Step 8 - Tied leading partner domains, default to last license created at partner domain' as mapping_step,
        8 as mapping_step_index
    
    from account_domains_ranked
    where database_type = 'multi-tenant'
        and is_account_override = false
        and account_level_is_managed_customer = false
        and account_level_business_domain_users = 0
        and account_level_partner_domain_users > 0
        and partner_domain_rank = 1
        and count_of_leading_partner_domains > 1
        and partner_domain_created_at_rank = 1

),

step_9 as (

    select
        account_id,
        '0014v00002OxoX7AAJ' as salesforce_account_id,
        cloud_account_name,
        'Dbt Labs' as salesforce_account_name,
        'dbtlabs.com' as email_domain,
        'Moderate' as mapping_confidence,
        'Step 9 - Has internal users, default to dbt Labs' as mapping_step,
        9 as mapping_step_index

    from account_domains_ranked
    where database_type = 'multi-tenant'
        and is_account_override = false
        and account_level_is_managed_customer = false
        and account_level_business_domain_users = 0
        and account_level_partner_domain_users = 0
        and account_level_internal_domain_users > 0
    group by 1,2,3,4,5,6,7,8
    

),

step_10 as (

    select
        account_id,
        salesforce_account_id,
        cloud_account_name,
        salesforce_account_name,
        billing_email_domain as email_domain,
        'Moderate' as mapping_confidence,
        'Step 10 - Consumer domains only, billing domain matches a consumer domain' as mapping_step,
        10 as mapping_step_index

    from account_domains_ranked
    where database_type = 'multi-tenant'
        and is_account_override = false
        and account_level_is_managed_customer = false
        and account_level_business_domain_users = 0
        and account_level_partner_domain_users = 0
        and account_level_internal_domain_users = 0
        and account_level_consumer_domain_users > 0
        and account_level_billing_domain_match = true
        and is_billing_domain = true

),

step_11 as (

    select
        account_id,
        salesforce_account_id,
        cloud_account_name,
        salesforce_account_name,
        email_domain,
        'Low' as mapping_confidence,
        'Step 11 - Consumer domains only, billing domain doesnt exist, grab leading consumer domain' as mapping_step,
        11 as mapping_step_index

    from account_domains_ranked
    where database_type = 'multi-tenant'
        and is_account_override = false
        and account_level_is_managed_customer = false
        and account_level_business_domain_users = 0
        and account_level_partner_domain_users = 0
        and account_level_internal_domain_users = 0
        and account_level_consumer_domain_users > 0
        and account_level_billing_domain_match = false
        and consumer_domain_rank = 1
        and count_of_leading_consumer_domains = 1

),

step_12 as (

    select
        account_id,
        salesforce_account_id,
        cloud_account_name,
        salesforce_account_name,
        email_domain,
        'Low' as mapping_confidence,
        'Step 12 - Consumer domains only, billing domain doesnt match a domain, tied leading consumer domains, default to last license created domain' as mapping_step,
        12 as mapping_step_index

    from account_domains_ranked
    where database_type = 'multi-tenant'
        and is_account_override = false
        and account_level_is_managed_customer = false
        and account_level_business_domain_users = 0
        and account_level_partner_domain_users = 0
        and account_level_internal_domain_users = 0
        and account_level_consumer_domain_users > 0
        and account_level_billing_domain_match = false
        and count_of_leading_consumer_domains > 1
        and consumer_domain_created_at_rank = 1

),

unioned as (
    {% for step_number in range (1,13) %}
    select * from step_{{ step_number }}
    {{ 'union all' if not loop.last }}
    {%- endfor %}
),

string_matching_confidence as (

    select
        *,
        jarowinkler_similarity(cloud_account_name, salesforce_account_name) as jarowinkler_score,

        case
            when jarowinkler_score >= 90 then 'Very High'
            when jarowinkler_score >= 80 then 'High'
            when jarowinkler_score >= 70 then 'Moderate'
            else 'Low'
        end as string_matching_confidence
    
    from unioned
)

select * from string_matching_confidence


