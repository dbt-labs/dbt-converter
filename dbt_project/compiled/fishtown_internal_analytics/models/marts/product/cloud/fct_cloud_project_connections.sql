

with

connections as (

    select * from analytics_dev.dbt_jstein.stg_cloud__connections
    where is_connection_deleted = 0
        and project_id is not null

),

adapters as (

    select * from analytics_dev.dbt_jstein.stg_cloud__dbt_adapters
    where is_adapter_deleted = 0
        and project_id is not null

),

adapter_connection_info as (

    select * from analytics_dev.dbt_jstein.stg_cloud__dbt_adapters_connection_info

),

adapter_info_joined as (

    select
        adapters.*,
        adapter_connection_info.connection_id
    
    from adapters
    left join adapter_connection_info
        on adapters.account_adapter_id = adapter_connection_info.adapter_id

),

connections_standardized as (

    select
        project_id,
        account_id,
        connection_id,
        type as adapter,
        created_at,
        updated_at

    from connections
    where type != 'adapter'

),

adapters_standardized as (
    
    select 
        project_id,
        account_id,
        connection_id,
        adapter_version as adapter,
        created_at,
        updated_at
    
    from adapter_info_joined
    
),

unioned as (
    
    select * from connections_standardized
    union all 
    select * from adapters_standardized
    
),

final as (

    select *
    from unioned
    -- take the most up to date connection, we've found an edge case
    -- with this in the past, but for the most part we expect this to
    -- be the best approach.
    qualify row_number() over (
        partition by project_id, connection_id
        order by updated_at desc
    ) = 1

)

select * from final