with

self_service_subs as (

    select * from {{ ref('fct_stripe_invoices') }}

),

stripe_subscription_seat_changes as (

    select * from {{ ref('fct_stripe_subscription_events') }}

),

managed_subs as (

    select * from {{ ref('fct_opportunities') }}

),

self_service_r3 as (

    select
        md5(invoice_id) as transaction_id,
        customer_id,
        customer_id_type,
        customer_name,
        stripe_customer_id,
        billing_account_id,
        cloud_account_id,
        salesforce_account_id,
        subscription_id as billing_contract_id,
            --TODO FOR ENTITIES
            --the contract/subscription that this transaction involves

        'Self-Service' as sales_motion,

    --we want to be able to highlight when a transaction contains
    --a failed CC payment so we can account for these failures
    --when we amortize transactions
        concat(
            coalesce(invoice_description,''),
            case when cc_failure_message is not null
                then '(cc payment failure)'
            else '' end
        ) as transaction_description,

    ----BOOLEANS
        false as is_subscription_charge,
        is_paid_invoice as is_paid,
        coalesce(
            subscription_prorations > 0,
            false
        ) as is_contract_change_event,

        invoice_date::date as invoice_date,
        subscription_created_date as contract_start_date,
        subscription_canceled_date as contract_end_date,
        usage_period_in_months,
        usage_start_date,
        usage_end_date,

    ----MONEY
        case
            when is_paid_invoice
                then invoice_subtotal
            else 0
        end as revenue_run_rate,

        0 as arr

    from self_service_subs
    where plan_id != 'free'
        and is_paid_subscription
            --^to remove subscriptions that do not have any payments
            --associated. otherwise it'll fan out downstream
        and is_charged_invoice
            -- remove empty invoices that don't have an impact on ARR
        and is_paid_invoice
        and (subscription_revenue > 0
            or subscription_prorations > 0)
        and (usage_start_date <= contract_end_date
            or contract_end_date is null)

),

self_service_arr as (

    select
        md5(unique_id) as transaction_id,
        customer_id,
        customer_id_type,
        customer_name,
        stripe_customer_id,
        billing_account_id,
        cloud_account_id,
        salesforce_account_id,
        subscription_id as billing_contract_id,
            --TODO FOR ENTITIES
            --the contract/subscription that this transaction involves

        'Self-Service' as sales_motion,

        concat(
            coalesce(invoice_description,''),
            case when cc_failure_message is not null
                then '(cc payment failure)'
            else '' end
        ) as transaction_description,

    --Booleans
        true as is_subscription_charge,
        is_paid_invoice as is_paid,

        coalesce(
            subscription_change_type in ('upgrade', 'downgrade'),
            false
        ) as is_contract_change_event,

    --Dates
        -- we don't have a hard link to an invoice related to seat upgrades. In
        -- this case, we're using the final updated date as that's when they are
        -- charged and for subscription charges, this is on the day of their
        --subscription start date.
        updated_at::date as invoice_date,
        subscription_created_date as contract_start_date,
        subscription_canceled_date as contract_end_date,

        datediff(
            month,
            updated_at::date,
            current_period_end
        ) as usage_period_in_months,

        -- we use the `updated_at` to account for upgrades/downgrades
        -- which is only recorded on the `updated_at` field
        -- otherwise, use the `usage_start_date` from the invoices
        -- model (e.g. 'cus_GywJI2b9Dv740T' --their subscription begins on the 4th,
        --        but the updated_at is afterward "midnight" so it shows the next day)
        case
            when subscription_change_type in ('upgrade', 'downgrade')
                then updated_at::date
            else usage_start_date
        end as usage_start_date,

        usage_end_date,

    --Money
        0 as revenue_run_rate,
        total_charged_amount * 12 as arr

    from stripe_subscription_seat_changes
    where plan_name != 'Team Plan'
    --[31-05-2022] we use Developer Licenses to calculate ARR and
    --Team Plan is always 0. We have a test to ensure this is always true
    --but if it changes, then we can be alerted.
    and plan_name != 'Free'
    and is_paid_subscription
        --^to remove subscriptions that do not have any payments
        --associated. this is important when we have change categories
        --in the final model (e.g. cus_KjmpgsxENMc8RE, cus_Kbjsim9hyLrpVb)
    and is_charged_invoice
    and not is_full_refund
    and (usage_start_date <= subscription_canceled_date
        or subscription_canceled_date is null)
        --There are occasions where we've continued to charge customers after
        --their subscription end date we want to remove those empty charges
        --(e.g. customer_id = 'cus_KERykJ2gzM1DEY')

),

managed as (

    select
        md5(opportunity_id) as transaction_id,
        customer_id,
        customer_id_type,
        customer_name,
        stripe_customer_id,
        billing_account_id,
        primary_cloud_account_id as cloud_account_id,
        account_id as salesforce_account_id,
        opportunity_id as billing_contract_id,
            --TODO FOR ENTITIES
            --the contract/subscription that this transaction involves

        'Managed' as sales_motion,

        opportunity_type as transaction_description,


    ----BOOLEANS
        true as is_subscription_charge,
        true as is_paid,
        coalesce(
            opportunity_type != 'Land',
            false
        ) as is_contract_change_event,

    ----DATES
        close_date as invoice_date,
        contract_start_date,
        dateadd('day',1,contract_end_date) as contract_end_date_adj,

        datediff(
            month,
            contract_start_date,
            contract_end_date
        ) as usage_period_in_months,

    --we use the close_date as the day we recognize revenue.
        close_date as usage_period_start_date,

    --1. If a managed account renews, then for the Land opp
        --we want to use the Close Date on the Renew opp
        --as the new `usage_period_end_date`
    --2. In addition, if there are two opps closed on the same date
        --we want to pull the max contract_end_date
        --this situation was identified for USAA opps (0066g00003P5BCRAA3,0064v00001pJ8vUAAS)
        --and also for Colors opps (0064v00001vtsGyAAI, 0064v00001rNyXKAA0)
        coalesce(
            case
                when 
                    not (opportunity_type in ('Land', 'Renew', 'Expand') and
                    lead(opportunity_type) over (
                        partition by account_id
                        order by close_date, contract_start_date
                    ) = 'Land')
                    then lead(close_date) over (
                    partition by account_id
                    order by close_date, contract_start_date)
            end,
            max(contract_end_date_adj) over (
                partition by account_id, close_date
                order by contract_start_date
                rows between unbounded preceding and current row)
        ) as usage_period_end_date,

    ----MONEY
        0 as revenue_run_rate,
        --TODO: we will add this at a later date
        sum(expected_arr_delta) over (
                partition by salesforce_account_id
                order by close_date,contract_start_date
                rows between unbounded preceding
                and current row
        ) as arr
--see Slack post for context on how we calculate ARR:
-- https://dbt-labs.slack.com/archives/C02V0EUV7QD/p1651466051118729?thread_ts=1651259235.988949&cid=C02V0EUV7QD
--see Recurring Revenue Definitions doc:
--https://www.notion.so/dbtlabs/dbt-Labs-Key-Metrics-Definitions-eb9a65e358fd455b955b8382e0148df6

    from managed_subs
    where opportunity_type not in ('Service', 'Cancel')
    and stage_name = 'Closed Won'

),

unioned as (

-- source field enables quicker debugging. 
    select 
        *,
        'self_service_r3' as source

    from self_service_r3

    union all

    select 
        *,
        'self_service_arr' as source

    from self_service_arr

    union all

    select 
        *,
        'managed' as source
    
    from managed

)

select * from unioned