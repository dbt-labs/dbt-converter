with 

sf_leads as (
    
    select * from {{ ref('stg_salesforce__touchpoints') }}
    where touchpoint_source = 'dbt Project Registration Form'

),

historical_leads as (
    
    select * from {{ ref('stg_googlesheets__dbt_project_reg') }}
    
),

sf_partners as (
    
    select * from {{ ref('stg_salesforce__partners') }}
    
),

identified_project_regs as (
    
    select
    
        historical_leads.*,
        sf_partners.partner_id
        
    from historical_leads
    left join sf_partners 
        on lower(historical_leads.partner_name) = lower(sf_partners.account_name)
    
),

unioned as (
    
    select 
    
        referred_by_partner_id,
        project_registration_type,
        touchpoint_source,
        message as project_details,
        created_at
    
    from sf_leads
    
    union all 
    
    select 
    
        partner_id as referred_by_partner_id,
        project_registration_type,
        'historical project registration' as lead_source,
        project_details,
        registered_at as created_at
    
    from identified_project_regs
    
)

select * from unioned