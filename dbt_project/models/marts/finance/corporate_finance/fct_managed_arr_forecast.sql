with 

base as (

    select * from {{ ref('stg_salesforce__opportunity_forecasts') }}
    where is_deleted = false

),

synth as (

    select 
    
        opp_forecast_id,
        opp_forecast_date::date as opp_forecast_date,
        close_date::date as close_date,
        contract_start_date::date as contract_start_date,
        contract_end_date::date as contract_end_date,
        opportunity_id,
        opportunity_name,
        opportunity_type,
        delta_arr,
        expected_delta_arr,

        case
            when expected_delta_arr > 0
            and opportunity_type = 'Land'
                then expected_delta_arr
            else null
        end as land_arr,

        case
            when expected_delta_arr > 0
            and opportunity_type in ('Expand','Renew')
                then expected_delta_arr
            else null
        end as expand_arr,

        case
            when expected_delta_arr > 0
                then expected_delta_arr
            else null
        end as gross_arr,

        case
            when expected_delta_arr < 0
                then expected_delta_arr
            else null
        end as churn_arr

    from base
)


select *
from synth