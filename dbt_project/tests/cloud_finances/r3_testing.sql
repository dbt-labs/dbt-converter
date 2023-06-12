with

subscription_transactions as (

    select * from {{ ref('fct_cloud_subscription_transactions') }}

),


self_service_2017 as (

    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_AD22271pJxYX0y'
    and date_day = '2017-10-31'
    and revenue_run_rate != 100

),

self_service_2019 as (

    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_AYhhu2Zs1hvTIM'
    and date_day = '2019-08-24'
    and revenue_run_rate != 156.64

),

self_service_2021 as (

    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_K11r4QR6EQyYKn'
    and date_day = '2021-08-30'
    and revenue_run_rate != 40.33

),

self_service_2021 as (
--this customer signed up and then added a seat
--later on the same day. their ARR is 1200
--for the period but their R3is 150 bc they added
--that extra seat.s
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_L4eX6FZGQuKLeY'
    and date_day = '2022-02-01'
    and arr = 1200
    and revenue_run_rate = 150

),

unioned as (

    select * from self_service_2017
        union all
    select * from self_service_2019
        union all
    select * from self_service_2021

)

select * from unioned