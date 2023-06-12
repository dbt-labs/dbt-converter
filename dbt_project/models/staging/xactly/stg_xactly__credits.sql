with

source as (

    select * from {{ source('xactly', 'credits') }}

),

final as (

    select
        trim(
            replace(split(name, '(')[1], ')', '')
        ) as salesforce_user_id,
        salesforce_opportunity_id,
        credit_type_id,

        trim(split(name, '(')[0]) as name,
        title_name,
        role,
        credit_type_name,

        case
            when left(salesforce_opportunity_id, 5) = '0064v'
                then true
            when left(salesforce_opportunity_id, 8) = 'Trigger1'
                then true
            else false
        end as is_sfdc_credit,

        case
            when left(salesforce_opportunity_id, 5) = '0064v'
                then true
            else false
        end as is_opportunity_level_credit,

        start_date::date as period_started_at,

        -- Breaking with ordering convention to enable union in next model
        amount

    from source

)

select * from final