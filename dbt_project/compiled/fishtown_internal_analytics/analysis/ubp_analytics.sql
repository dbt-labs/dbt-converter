with 

sessions as (

    select * from dbt_cloud_pr_1862_523.fct_cloud_ide_sessions

),

customers as (

    select * from analytics.dim_customers

),

runs as (

    select *
    from dbt_cloud_pr_1862_523.fct_cloud_run_metrics
    where type = 'cloud_run'

),

accounts as (

    select * from dbt_cloud_pr_1862_523.fct_cloud_accounts

),

transactions as (

    select
        date_month,
        customer_id, 
        revenue as monthly_revenue
    from analytics.fct_subscription_transactions

),

sessions_agg_multi as (

      select 
        accounts.account_id,
        accounts.name,
        date_trunc('month', running_at)::date as date_month,
        accounts.plan,
        sum(time_engaged_in_s) / 3600::numeric(38,6) as usage_hours
    from sessions
    left join accounts on sessions.account_id = accounts.account_id
    where running_at > to_date('01/01/2020', 'mm/dd/yyyy')
    group by 1, 2, 3, 4
  
),

sessions_agg_single as (
  
    select
        cloud_account_id::integer as account_id,
        accounts.name,
        date_trunc('month', page_view_start)::date as date_month,
        accounts.plan,
        sum(time_engaged_in_s) / 3600::numeric(38,6) as usage_hours
    from dbt_bthomson.fct_web_pageviews pageviews
    left join accounts on pageviews.cloud_account_id::integer = accounts.account_id
    where cloud_page_type ='ide' 
      and page_view_start > to_date('01/01/2020', 'mm/dd/yyyy')
      and accounts.database_type = 'single-tenant'
//      and cloud_account_id = '10576852113892466924'
//    //and page_url_host not in ('cloud.getdbt.com','www.getdbt.com') and page_url_path not like '/signup%'
    group by 1,2,3,4
//    order by 1,2
//    limit 100;

),

sessions_agg as (

    select *, 'multi-tenant' as database_type from sessions_agg_multi
    union all
    select *, 'single-tenant' as database_type from sessions_agg_single

),

runs_agg as (

    select
        accounts.account_id,
        accounts.name,
        date_trunc('month', runs.created_at)::date as date_month,
        accounts.plan,
        accounts.database_type,
        sum(duration_in_sec) / 3600::numeric(38,6) as usage_hours
    from runs
    left join accounts on runs.account_id = accounts.account_id
    where type = 'cloud_run'
        and runs.created_at > to_date('01/01/2020', 'mm/dd/yyyy')
    group by 1, 2, 3, 4, 5

),

joined as (

    select 

        coalesce(sessions_agg.account_id, runs_agg.account_id) as account_id,
        coalesce(sessions_agg.name, runs_agg.name) as name,
        coalesce(sessions_agg.date_month, runs_agg.date_month) as date_month,
        coalesce(sessions_agg.plan, runs_agg.plan) as plan,
        coalesce(sessions_agg.usage_hours, 0.00) as ide_hours,
        coalesce(runs_agg.usage_hours, 0.00) as job_hours,
        coalesce(runs_agg.database_type, sessions_agg.database_type) as database_type

    from sessions_agg

    full outer join runs_agg 
        on sessions_agg.date_month = runs_agg.date_month
            and sessions_agg.plan = runs_agg.plan
            and sessions_agg.account_id = runs_agg.account_id

),

brute_force as (

  select
    joined.*,
    case
      when joined.account_id = 14440245583284183438
        then '0016g00000EE75lAAD' -- USAA-ADMIN
//      when account_id = 300467727865345857
//        then '' NatWest - idev
      when joined.account_id = 2316119708723548084
        then '0016g00000EE75lAAD' -- USAA-SANDBOX
      when joined.account_id = 9538411712910422508
        then '0016g00000EE75lAAD' -- USAA-BANK
      when joined.account_id = 9686205153350577332
        then '0014v00002KwAjeAAF' -- Taxfix
      when joined.account_id = 11282262026083546606
        then '0016g00000pIwX3AAK' -- BIAHealthNZ
      when joined.account_id = 4423495548524176889
        then '0016g00000IemYSAAZ' -- Cambia-Prd
      when joined.account_id = 3742352612179652646
        then '0014v00002Kw2iYAAR' -- Mirvac
      when joined.account_id = 6318873540958397807
        then '0016g00000EE75lAAD' -- USAA-PNC
      when joined.account_id = 11893058942486984237
        then '0014v00002IdoCuAAJ' -- nasdaq_prod_dbt
      when joined.account_id = 9627538463975772867
        then '0016g00000FXHTdAAP' -- CONA
      when joined.account_id = 4009212871756651137
        then '0016g00000FXHTdAAP' -- CCSWB
      when joined.account_id = 9312348923423947280
        then '0016g00000Nvk8UAAR' -- Not On The High Street
      when joined.account_id = 2454651158664427313
        then '0016g00000EEXvrAAH' -- WWE
      when joined.account_id = 3595727949731959689
        then '0016g00000FXHTdAAP' -- CCCi
      when joined.account_id = 2403772352399066761
        then '0014v00002IcUaeAAF' -- Paxos
      when joined.account_id = 14113968028104133077
        then '0016g00000FXHTdAAP' -- CCBU
      when joined.account_id = 16721192313077438256
        then '0016g00000FXHTdAAP' -- CCRC
      when joined.account_id = 15698322141321804804
        then '0016g00000EFCnXAAX' -- Blend
      when joined.account_id = 17120700559404974099
        then '0016g00000IemYSAAZ' -- Cambia-UAT
      when joined.account_id = 18296890960614650763
        then '0016g00000FXHTdAAP' -- CCNNE
      when joined.account_id = 18139278767553269788
        then '0016g00000EE75lAAD' -- USAA-BANK
      when joined.account_id = 3261353933304672029
        then '0016g00000IemYSAAZ' -- Cambia-Dev
      when joined.account_id = 2009336084629415715
        then '0014v00002KvE76AAF' -- Trustly
      when joined.account_id = 17141512089766441229
        then '0014v00002Id2ZeAAJ' -- Scentre Group
      when joined.account_id = 18091577868407965542
        then '0016g00000EE75lAAD' -- USAA-SANDBOX
      when joined.account_id = 8356686922567886625
        then '0016g00000MCj4gAAD' -- Peloton Dev
      when joined.account_id = 6322478723104857914
        then '0016g00000FXHTdAAP' -- CCBF
      when joined.account_id = 4847647666673276809
        then '0014v00002Icj2hAAB' -- CH Robinson
      when joined.account_id = 10576852113892466924
        then '0016g00000YNBugAAH' -- IntegraConnect
    end as brute_force_customer_id,
    coalesce(brute_force_customer_id, customer_id) as joining_customer_id
  from joined
  left join customers on joined.account_id = customers.account_id
      and sales_motion = 'Enterprise'
  
),

updated_aggregates as (
  
   select
        joining_customer_id,
        date_month,
        plan,
        max(
          case 
            when database_type = 'single-tenant'
                then 1
            else 0
        end) as is_single_tenant,
        sum(ide_hours) as ide_hours,
        sum(job_hours) as job_hours
    from brute_force
  group by 1,2,3

),

customers_joined as (

    select 
        updated_aggregates.*,
        customers.customer_name,
        transactions.monthly_revenue
    from updated_aggregates
    left join customers on updated_aggregates.joining_customer_id = customers.customer_id
        and sales_motion = 'Enterprise'
    left join transactions on customers.customer_id = transactions.customer_id
        and updated_aggregates.date_month = transactions.date_month

)

//temp as (

select 
    *,
    ide_hours + job_hours as total_usage_hours
from customers_joined
where plan = 'enterprise'
    and date_month < to_date('08/01/2021')
order by 1, 2
  
//  )
//  
//  select distinct account_id, name from temp where account_id > 30000;
//
//