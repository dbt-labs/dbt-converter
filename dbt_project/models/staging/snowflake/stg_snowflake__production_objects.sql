with

snowflake_objects as (

    select * from {{ source('snowflake_analytics_information_schema', 'tables') }}
    where table_schema != 'INFORMATION_SCHEMA'
    qualify row_number() over (partition by table_name order by last_altered desc) = 1

),

final as (

    select
        lower(table_name) as snowflake_object_name,
        table_type as snowflake_object_type,
        row_count as object_size_in_rows,
        bytes / 1000000000 as object_size_in_gigabytes
    
    from snowflake_objects

)

select * from final