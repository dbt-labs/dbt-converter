with resource_count_events as (

    select * from {{ ref('stg_dbt_resource_count_events') }}
    where 1=1

    {% if target.name in ['dev', 'default'] %}

        and invocation_at >= dateadd(d, -{{var('testing_days_of_data')}}, current_date)

    {% endif %}
    
),

ranked as (

    select
        *,
        rank() over (partition by invocation_id order by invocation_at) as idx

    from resource_count_events
    qualify idx = 1

)

select * from ranked
