with

source as (

    select * from raw.fivetran_datadog.datadog_total_requests_aws_st

),

renamed as (

    select
        'singletenant' as instance_type,
        regexp_substr(
            query_expression,
            'dbt_instance:([^,]*)',
            1, 1, 'e', 1
        ) as dbt_instance,
        to_timestamp(unix_timestamp::int / 1000) as requests_date,
        count as daily_requests_total

    from source
    where dbt_instance != 'N/A'

)

select * from renamed