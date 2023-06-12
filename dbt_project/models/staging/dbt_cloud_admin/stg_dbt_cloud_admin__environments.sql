with

source as (

    select * from {{ source('dbt_cloud_admin', 'environments') }}

),

final as (

    select
        id as environment_id,
        
        name as environment_name,
        dbt_version,
        type as dbt_cloud_environment_type,

        lower(credentials:user::string) as connection_user,
        lower(credentials:warehouse::string) as connection_warehouse,
        lower(credentials:database::string) as connection_database,
        lower(credentials:schema::string) as connection_schema,
        lower(credentials:role::string) as connection_role,
        credentials:target_name::string as target,
        credentials:threads::number as threads,

        custom_branch,
        use_custom_branch as is_custom_branch,

        case
            when connection_database = 'analytics' and connection_schema = 'analytics'
                then true
            else false
        end as is_production_environment,

        case
            when state = 2
                then true
            else false
        end as is_deleted,
        
        created_at

    from source

)

select * from final