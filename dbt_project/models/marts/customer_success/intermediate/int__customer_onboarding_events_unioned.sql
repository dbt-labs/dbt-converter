with 

warehouse_connection as (

    select * from {{ ref('stg_cloud__connections') }} -- warehouse connection 

), 

git_connection as (

    select * from {{ ref('stg_cloud__repos') }} -- github connection

),

tickets as (

    select * from {{ ref('fct_support_tickets') }} 
    where is_setup -- only grab setup tickets
    and salesforce_account_id is not null

),

cloud_accounts as (

    select * from {{ ref('fct_cloud_accounts') }}
    
),

sso_setup as (

    select * from {{ ref('stg_cloud__accounts_snapshot_daily') }} 
    where is_sso = true 

), 

salesforce_accounts as (

    select * from {{ ref('dim_salesforce_accounts') }}
    where became_customer_on is not null

),

account_history as (

    select * from {{ ref('stg_salesforce__account_history') }}

),

asana_tasks as (

    select * from {{ref('fct_services_delivery')}} 
    where product_name ilike '%rapid%onboarding%'
    and salesforce_account_id is not null

), 

cloud_accounts_enriched as( --We join in became_customer_on in a CTE here over bringing it into fct_cloud_accounts 
                            --because the `fct_cloud_accounts` only should reflect the current snapshot of the world.
                            --For example: if a managed account churns, then the `became_customer_on` in the
                            --`fct_cloud_accounts` model would _not_ be null and therefore indicate that they're still
                            --a customer. We can add logic in `fct_cloud_accounts` to null the date if there were no longer
                            --customers but that detracts from what `fct_cloud_accounts` _should_ represent vs joining the
                            --`dim_salesforce_accounts` in the BI layer. 
                            --We can revisit this in the future if we foresee the `became_customer_on` being valuable in the
                            --`fct_cloud_accounts` model.
    select 
        cloud_accounts.*,
        salesforce_accounts.became_customer_on

    from cloud_accounts 
    left join salesforce_accounts 
        on cloud_accounts.salesforce_account_id = salesforce_accounts.account_id

), 

close_date_events as (

    select 
        account_id as salesforce_account_id, 
        'closed_won' as event_name, 
        became_customer_on as event_date

    from salesforce_accounts
        
),

kickoff_call_events as (

    select 
        account_id as salesforce_account_id, 
        'kickoff_call_completed' as event_name,
        first_kickoff_call_date as event_date

    from salesforce_accounts
    -- Remove kickoff calls before the closed-won date
    where first_kickoff_call_date > became_customer_on

),

warehouses_aggregated as (
	
    select
        cloud_accounts_enriched.salesforce_account_id,
        'first_warehouse_connection_created' as event_name,
        min(warehouse_connection.created_at)::date as event_date

    from warehouse_connection
    inner join cloud_accounts_enriched 
        on warehouse_connection.account_id = cloud_accounts_enriched.account_id
    where warehouse_connection.created_at::date >= cloud_accounts_enriched.became_customer_on
    group by 1
	
),

git_aggregated as (
	
    select
        cloud_accounts_enriched.salesforce_account_id,
        'first_repository_connection_created' as event_name,
        min(git_connection.created_at)::date as event_date

    from git_connection
    inner join cloud_accounts_enriched 
        on git_connection.account_id = cloud_accounts_enriched.account_id
    where git_connection.created_at::date >= became_customer_on 
    group by 1

), 

sso_aggregated as (
	
    select
        cloud_accounts_enriched.salesforce_account_id,
        'sso_setup_completed' as event_name,
        min(sso_setup.updated_at)::date as event_date

    from sso_setup
    inner join cloud_accounts_enriched 
        on sso_setup.account_id = cloud_accounts_enriched.account_id
    where sso_setup.updated_at::date >= became_customer_on
    group by 1
	
),

ticket_opened_events as (

    select
        salesforce_account_id, 
        'setup_ticket_opened' as event_name, 
        min(created_at)::date as event_date 

    from tickets 
    group by 1,2

), 

ticket_closed_events as (

    select 
        salesforce_account_id, 
        'setup_ticket_closed' as event_name,
        min(first_closed_at_business)::date as event_date

    from tickets
    group by 1,2

),

asana_tasks_start_date_events as (

    select
        salesforce_account_id,
        'rapid_onboarding_started' as event_name,
        min(start_date)::date as event_date

    from asana_tasks
    group by 1,2

), 

asana_tasks_end_date_events as (

    select 
        salesforce_account_id, 
        'rapid_onboarding_ended' as event_name,
        min(due_date)::date as event_date

   from asana_tasks
   group by 1,2

), 

utilization_events as (

    select
        account_id as salesforce_account_id,
        'utilization' as event_name, 
        min(valid_from) as event_date

    from account_history
    where customer_life_cycle_phase = 'Utilization'
    group by 1

),

unioned as (

    select * from close_date_events
    union all 
    select * from kickoff_call_events
    union all 
    select * from warehouses_aggregated
    union all 
    select * from git_aggregated
    union all 
    select * from sso_aggregated
    union all 
    select * from ticket_opened_events
    union all 
    select * from ticket_closed_events
    union all
    select * from asana_tasks_start_date_events
    union all 
    select * from asana_tasks_end_date_events
    union all 
    select * from utilization_events

)

select * from unioned 
