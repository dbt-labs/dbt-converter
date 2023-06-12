with

nps_raw as (

    select * from {{ ref('fct_customer_nps') }}
    where feedback_source = 'dbt_cloud_nps'

),

support_tickets as (

    select * from {{ ref('fct_support_tickets') }}

),

mappings as (

    select * from {{ ref('cloud_account_mappings') }}
    where is_current_paying_account

),

customers as (

    select distinct
        customer_id
    from mappings

),

nps as (

    select
        mappings.customer_id,
        sum(case when nps_category = 'promoter' then 1 else 0 end) as total_promoters,
        sum(case when nps_category = 'detractor' then 1 else 0 end) as total_detractors,
        count(nps_raw.unique_id) as total_responses
    from nps_raw
    inner join mappings
        on nps_raw.dbt_cloud_account_id = mappings.account_id
    group by 1
),

csat as (

    select
        mappings.customer_id,
        avg(customer_rating) as avg_csat,
        count(distinct ticket_id) as total_support_tickets,
        sum(
           case
              when status ilike 'open' then 1
              else 0
           end
        ) as open_support_tickets
    from support_tickets
    inner join mappings
        on support_tickets.cloud_account_id = mappings.account_id
    group by 1

),

joined as (

    select
        customers.customer_id,
        csat.avg_csat,
        csat.total_support_tickets,
        csat.open_support_tickets,
        ((nps.total_promoters/nps.total_responses) - (nps.total_detractors/nps.total_responses))*100 as nps_score

    from customers
    left join nps
        on customers.customer_id = nps.customer_id
    left join csat
        on customers.customer_id = csat.customer_id

)

select * from joined