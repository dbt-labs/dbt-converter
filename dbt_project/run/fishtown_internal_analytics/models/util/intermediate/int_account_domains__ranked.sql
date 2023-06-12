
  
    

        create or replace transient table analytics_dev.dbt_jstein.int_account_domains__ranked  as
        (

with

account_domains as (

    select * from analytics_dev.dbt_jstein.int_account_domains__aggregated

),

business_domains_ranked as (

    select
        account_id,
        email_domain,
        dense_rank() over (partition by account_id order by count_of_business_domain_users desc nulls last) as business_domain_rank,
        row_number() over (partition by account_id order by count_of_business_domain_users desc nulls last, first_license_created_at) as business_domain_created_at_rank

    from account_domains
    where account_level_business_domain_users > 0

),

partner_domains_ranked as (

    select
        account_id,
        email_domain,
        dense_rank() over (partition by account_id order by count_of_partner_domain_users desc nulls last) as partner_domain_rank,
        row_number() over (partition by account_id order by count_of_partner_domain_users desc nulls last, first_license_created_at) as partner_domain_created_at_rank

    from account_domains
    where account_level_partner_domain_users > 0

),

internal_domains_ranked as (

    select
        account_id,
        email_domain,
        dense_rank() over (partition by account_id order by count_of_internal_domain_users desc nulls last) as internal_domain_rank,
        row_number() over (partition by account_id order by count_of_internal_domain_users desc nulls last, first_license_created_at) as internal_domain_created_at_rank

    from account_domains
    where account_level_internal_domain_users > 0

),

consumer_domains_ranked as (

    select
        account_id,
        email_domain,
        dense_rank() over (partition by account_id order by count_of_consumer_domain_users desc nulls last) as consumer_domain_rank,
        row_number() over (partition by account_id order by count_of_consumer_domain_users desc nulls last, first_license_created_at) as consumer_domain_created_at_rank

    from account_domains
    where account_level_consumer_domain_users > 0

),

joined as (

    select
        account_domains.*,
        
        count(distinct 
            case
                when business_domain_rank = 1 then account_domains.email_domain
        end) over (partition by account_domains.account_id) as count_of_leading_business_domains,
        business_domains_ranked.business_domain_rank,
        business_domains_ranked.business_domain_created_at_rank,
        
        count(distinct 
            case
                when partner_domain_rank = 1 then account_domains.email_domain
        end) over (partition by account_domains.account_id) as count_of_leading_partner_domains,
        partner_domains_ranked.partner_domain_rank,
        partner_domains_ranked.partner_domain_created_at_rank,
        
        count(distinct 
            case
                when internal_domain_rank = 1 then account_domains.email_domain
        end) over (partition by account_domains.account_id) as count_of_leading_internal_domains,
        internal_domains_ranked.internal_domain_rank,
        internal_domains_ranked.internal_domain_created_at_rank,
        
        count(distinct 
            case
                when consumer_domain_rank = 1 then account_domains.email_domain
        end) over (partition by account_domains.account_id) as count_of_leading_consumer_domains,
        consumer_domains_ranked.consumer_domain_rank,
        consumer_domains_ranked.consumer_domain_created_at_rank
        
        
    from account_domains
    
    left join business_domains_ranked
        on account_domains.account_id = business_domains_ranked.account_id
        and account_domains.email_domain = business_domains_ranked.email_domain
    
    left join partner_domains_ranked
        on account_domains.account_id = partner_domains_ranked.account_id
        and account_domains.email_domain = partner_domains_ranked.email_domain
    
    left join internal_domains_ranked
        on account_domains.account_id = internal_domains_ranked.account_id
        and account_domains.email_domain = internal_domains_ranked.email_domain
    
    left join consumer_domains_ranked
        on account_domains.account_id = consumer_domains_ranked.account_id
        and account_domains.email_domain = consumer_domains_ranked.email_domain
    

)

select * from joined
        );
      
  