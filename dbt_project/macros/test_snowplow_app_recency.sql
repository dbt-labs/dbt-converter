
{#
    --Returns 1 row if no records are found in the Snowplow event table
    --for the specified app_id in the given error_after time range
#}

{% test snowplow_app_recency(model, app_id, error_after) %}

with recency as (

    select max(collector_tstamp) as max_collector_tstamp
    from {{ model }}
    where app_id = '{{ app_id }}'

),

comparison as (

    select

        max_collector_tstamp,
        current_timestamp() - interval '{{ error_after }}' as error_after_ts
        
    from recency

)

select * from comparison
where max_collector_tstamp < error_after_ts

{% endtest %}
