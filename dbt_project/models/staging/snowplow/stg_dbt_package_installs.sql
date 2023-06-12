with package_installs as (

    select * from {{ ref('current_snowplow_package_install') }}

    where 1=1

    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

    {% endif %}
    
    {% if is_incremental() %}

        and _loaded_at >= (select max(installed_at) from {{ this }})

    {% endif %}


),

start_events as (

    select * from {{ ref('current_snowplow_invocation') }}
    where command = 'deps'
        and progress = 'start'

    {% if target.name in ['dev', 'default'] %}

        and _loaded_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

    {% endif %}

    {% if is_incremental() %}

        and _loaded_at >= (select max(installed_at) from {{ this }})

    {% endif %}

),



joined as (

    select
        package_installs.event_id,
        package_installs.invocation_id,
        package_installs._loaded_at as installed_at,

        -- see https://github.com/fishtown-analytics/dbt/pull/2600
        case
            when start_events.version ilike '=0.17.0%' and package_installs.source = 'local'
                then md5(package_installs.name)
            else package_installs.name
        end as package_name,

        package_installs.source as package_installation_method,
        package_installs.version as package_version,

        start_events.project_id,
        start_events.version as dbt_version

    from package_installs

    left join start_events
        on package_installs.invocation_id = start_events.invocation_id

)

select * from joined
