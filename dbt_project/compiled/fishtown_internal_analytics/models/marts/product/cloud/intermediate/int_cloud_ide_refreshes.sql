

with page_views as (

    select * from analytics_dev.dbt_jstein.int_snowplow_page_views

),

with_previous as (

    select
        *,
        user_custom_id as user_id,

        lag(page_url_fragment) over (
            partition by session_id
            order by page_view_start
        ) as previous_page_url_fragment,

        lag(page_view_end) over (
            partition by session_id
            order by page_view_start
        ) as previous_page_view_end,

        datediff(second, previous_page_view_end, page_view_start) as page_load_difference_in_s

    from page_views

)

select
    page_view_id,
    session_id,
    page_view_start,
    page_view_end,
    previous_page_view_end,
    previous_page_url_fragment,
    page_load_difference_in_s,
    true as is_refresh

from with_previous

-- Consider it a reload if the new page loads < 10 seconds after the
-- last page view and the page url fragments are identical
where page_url_fragment = previous_page_url_fragment
  and page_load_difference_in_s between 0 and 15