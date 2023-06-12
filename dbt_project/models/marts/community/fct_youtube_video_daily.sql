{% set window_clause = "partition by video_id order by date_day" %}

{% set new_video_clause = "date_day = video_published_at::date" %}

{% set video_metrics = ['comments', 'favorites', 'likes', 'views'] %}

with

videos as (

    select * from {{ ref('stg_youtube__videos') }}

),

-- The below window functions allow us to calculate day-over-day change, which in turn provides daily metrics
windowed as (

    select
        *,
        
        {% for video_metric in  video_metrics %}
        case
            when {{ new_video_clause }} then count_{{ video_metric }}
            else count_{{ video_metric }} - lag(count_{{ video_metric }}) over ({{ window_clause }})
        end as count_new_{{ video_metric }}
            {% if not loop.last %} , {% endif %}
        {% endfor %}

    from videos

)

select * from windowed