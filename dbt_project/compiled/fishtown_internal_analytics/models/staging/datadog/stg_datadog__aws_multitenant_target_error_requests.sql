with

source as (

    select * from raw.fivetran_datadog.datadog_target_error_requests_aws_mt

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
        count as target_error_requests_total

    from source
    where dbt_instance != 'N/A'

)

select * from renamed