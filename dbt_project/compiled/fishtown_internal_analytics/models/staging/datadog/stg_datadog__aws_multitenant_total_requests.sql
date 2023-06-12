with

source as (

    select * from raw.fivetran_datadog.datadog_total_requests_aws_mt

),

renamed as (

    select
        'multitenant' as instance_type,
        regexp_substr(
            query_expression,
            'dbt_instance:([^,]*)',
            1, 1, 'e', 1
        ) as dbt_instance,
        to_timestamp(unix_timestamp::int / 1000) as requests_date,
        count as daily_requests_total,

        -- prod-au environment was inconsistently named when first spun up
        -- https://dbtlabsmt.datadoghq.com/notebook/5438991/example-multiple-prod-au-s
        case
            when regexp_like(dbt_instance, 'prod-au[s]?$')
                and requests_date between '2022-10-12' and '2022-10-18'
                    then false
        else true
        end as is_valid_data

    from source
    where dbt_instance != 'N/A'

),


final as (

    select * exclude is_valid_data
    from renamed
    where is_valid_data = true

)

select * from final