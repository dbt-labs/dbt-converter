with

subscription_transactions as (

    select * from {{ ref('fct_cloud_subscription_transactions') }}

),

self_service as (
--self-service with a subscription revenue that we had to calculate via invoice_items formula
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_GAPymcBIVcZlgS'
    and date_day = '2022-04-14'
    and arr != 600
    and revenue_run_rate != 50

),

self_service_2019 as (
--back when we charged 40 per seat and 100 basic plan
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_FxuXmmiPPmpT3A'
    and date_day = '2019-11-18'
    and arr != 2160

),

self_service_2019_shift as (
--back when we charged 40 per seat and 100 basic plan;
--this person removed their slots
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_FxuXmmiPPmpT3A'
    and date_day = '2019-11-19'
    and arr != 1680

),

self_service_2020 as (
--when we switched from Basic Subscription to Developer License
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_Eds1hDgah84KbA'
    and date_day = '2020-01-15'
    and arr != 1200

),

self_service_no_invoice as (
--When we didn't use the concept of invoices, this is a sanity check to
--ensure that we're accounting for these customers pre-2020
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_DplY7cZUjopGHc'
    and date_day = '2019-03-21'
    and arr != 1200

),

self_service_weird_invoice_blip as (
--There's an empty subscription update event (event_id = 'evt_1I5ELEKS6Y3lIras9aAZ5zM9')
--where there was a subscription update but no changes were actually made. This caused
--us to double count ARR between 2020-01-02 - 2020-01-10.
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_IK8O9JqPzjrOwC'
    and date_day = '2020-01-03'
    and arr != 4200

),

self_service_midupgrade1 as (
--This customer added a seat mid-cycle
--so this is the day before they added a seat
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_IG6OLiFLNuxUjz'
    and date_day = '2022-01-09  '
    and arr != 13800

),

self_service_midupgrade2 as (
--This customer added a seat mid-cycle
--so this is the day they added a seat
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_IG6OLiFLNuxUjz'
    and date_day = '2022-01-10'
    and arr != 14400

),

self_service_refunded as (
--self-service with a subscription revenue where we had to calculate the refund tax to get the correct subscription revenue
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_KEQJmSEPFk5I9r'
    and date_day = '2021-12-01'
    and arr != 1800
    and revenue_run_rate != 150

),

self_service_payment_failure as (
--self-service that had a payment failure on May 22nd and resolved it on the 31st
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_IkO9tZmZddoGll'
    and date_day = '2022-05-30'
    and change_category != 'churn'
    and arr_prior != 5400
),

managed as (
--managed account arr example
    select
        customer_id
    from subscription_transactions
    where salesforce_account_id = '0014v00002Ob7tvAAB'
    and date_day = '2022-04-21'
    and arr != 22680

),

managed_arr_upgrade as (
--managed account arr example
    select
        customer_id
    from subscription_transactions
    where salesforce_account_id = '0016g00000JE3afAAD'
    and date_day = '2021-06-29'
    and arr != 108000

),

managed_arr_double_opps_close_date as (
--managed account arr example where they had a renew
--and an upsell on the same close date
--see Slack convo: https://dbt-labs.slack.com/archives/C02V0EUV7QD/p1653416004428769?thread_ts=1652919913.817809&cid=C02V0EUV7QD
    select
        customer_id
    from subscription_transactions
    where salesforce_account_id = '0014v00002Ox9QWAAZ'
    and date_day = '2021-05-12'
    and arr != 121600

),

unioned as (

    select * from self_service
        union all
    select * from self_service_2019
        union all
    select * from self_service_2019_shift
        union all
    select * from self_service_2020
        union all
    select * from self_service_no_invoice
        union all
    select * from self_service_weird_invoice_blip
        union all
    select * from self_service_midupgrade1
        union all
    select * from self_service_midupgrade2
        union all
    select * from self_service_refunded
        union all
    select * from self_service_payment_failure
        union all
    select * from managed
        union all
    select * from managed_arr_upgrade
        union all
    select * from managed_arr_double_opps_close_date
)

select * from unioned