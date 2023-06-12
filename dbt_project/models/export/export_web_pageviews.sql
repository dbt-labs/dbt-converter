with

pageviews as (

    select * from {{ref('fct_web_pageviews')}}
    
    {% if target.name in ['dev', 'default'] %}

        where page_view_start >= dateadd(d, -{{ var('testing_days_of_data') }}, current_date)

    {% endif %}


)

select * from pageviews