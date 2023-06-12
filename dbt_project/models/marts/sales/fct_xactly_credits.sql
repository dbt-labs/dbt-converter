with

opportunity_credits as (

    select * from {{ ref('stg_xactly__credits') }}
    where is_opportunity_level_credit = true

),

other_credits as (

    select * from {{ ref('stg_xactly__credits') }}
    where is_opportunity_level_credit = false

),

opportunities as (

    select * from {{ ref('fct_opportunities') }}

),

opportunity_credits_joined as (

    select
        opportunity_credits.* exclude period_started_at,
        {{ dbt.date_trunc(
            'month', 'opportunities.close_date'
        ) }} as period_started_at

    from opportunity_credits
    left join opportunities
        on opportunity_credits.salesforce_opportunity_id = opportunities.opportunity_id

),

aggregated as (

    select
        salesforce_user_id,
        salesforce_opportunity_id,
        credit_type_id,

        name,
        title_name,
        role,
        credit_type_name,

        is_sfdc_credit,
        is_opportunity_level_credit,

        period_started_at,

        sum(amount) as amount

    from opportunity_credits_joined
    {{ dbt_utils.group_by(n=10) }}

),

all_credits as (

    select * from aggregated
    union
    select * from other_credits

)

select * from all_credits