with

subscription_transactions as (

    select * from {{ ref('fct_cloud_subscription_transactions') }}

),

reactivation_ss as (
--self-service reactivation after a payment failure
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_Hj2PRh5MAjKLWM'
    and date_day = '2021-04-07'
    and change_category != 'reactivation'

),

ss_churn as (
--self-service account churn
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_HQjFJMPgSLTSiY'
    and date_day = '2021-02-08'
    and change_category != 'churn'

),

ss_churn_payment_failure as (
--self-service account churn due to payment failure
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_JsbWtbDTZ4BRcE'
    and date_day = '2021-05-23'
    and change_category != 'churn'

),

managed_churn as (
--managed account churn
    select
        customer_id
    from subscription_transactions
    where salesforce_account_id = '0016g00000IfKmZAAV'
    and date_day = '2020-09-29'
    and change_category != 'churn'

),

s2m as (
--self-service upgrade
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_KCB3DnUduJOjXC'
    and date_day = '2022-03-07'
    and change_category != 'S2M'

),

upgrade_managed as (
--managed account upgrade
    select
        customer_id
    from subscription_transactions
    where salesforce_account_id = '0016g00000KLY3dAAH'
    and date_day = '2020-11-20'
    and change_category != 'S2M (managed upgrade)'
),

upgrade_ss as (
--self-service account upgrade
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_KIJMyKFyyY1BHi'
    and date_day = '2022-02-08'
    and change_category != 'upgrade'
),

downgrade_managed as (
--managed account downgrade
    select
        customer_id
    from subscription_transactions
    where salesforce_account_id = '0016g00000IfKmdAAF'
    and date_day = '2021-01-15'
    and change_category != 'downgrade'
),

downgrade_ss as (
--self-service account downgrade
    select
        customer_id
    from subscription_transactions
    where customer_id = 'cus_Fp0DUcfSFbWmqH'
    and date_day = '2020-10-09'
    and change_category != 'downgrade'
),

unioned as (

    select * from reactivation_ss
        union all
    select * from ss_churn
        union all
    select * from ss_churn_payment_failure
        union all
    select * from managed_churn
        union all
    select * from s2m
        union all
    select * from upgrade_managed
        union all
    select * from upgrade_ss
        union all
    select * from downgrade_managed
        union all
    select * from downgrade_ss

)

select * from unioned