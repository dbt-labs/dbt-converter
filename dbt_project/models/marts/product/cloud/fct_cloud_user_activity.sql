with

page_views as (

    select * from {{ ref('fct_web_pageviews') }}

),

all_days as (

    select * from {{ref('all_days')}}

),

users as (

    select * from {{ ref('fct_cloud_users') }}

),

cloud_page_views as (

    select
      page_view_start::date as date_day,
      user_custom_id as user_id,
      page_view_start,
      page_view_end

    from page_views
    -- inner-join to only capture pageviews from authenticated users (ie. Cloud users)
    --where we know they are logged in
    join users on page_views.user_custom_id::string = users.user_id::string

),

docs_training_page_views as (

    select 
      page_view_start::date as date_day,
      inferred_user_id as user_id,
      page_view_start,
      page_view_end,
      case 
        when app_id = 'docs.getdbt.com' 
        and (page_url_path like '/reference/warehouse-profiles/%' 
        or page_url_path like '/reference/resource-configs/%') 
      then 1 else 0 end as docs_warehouse_pageviews,
      case 
        when app_id = 'docs.getdbt.com' 
        and page_url_path like '/tutorial/%' 
      then 1 else 0 end as docs_tutorial_pageviews,
      case 
        when app_id = 'courses.getdbt.com' 
        and page_url_path like '/courses/take/%' 
      then 1 else 0 end as training_pageviews
    from page_views 
    -- inner-join to only capture pageviews from authenticated users (ie. Cloud users)
    --where we know they are logged in
    join users on page_views.inferred_user_id::string = users.user_id::string
    where app_id in ('docs.getdbt.com','courses.getdbt.com')

),

first_and_last_activity as (

    select
        user_id,
        min(page_view_start)::date as first_activity_date,
        max(page_view_end)::date as last_activity_date

    from cloud_page_views
    group by 1

),

daily_activity_cloud as (

    select
      cloud_page_views.date_day,
      cloud_page_views.user_id,
      count(*) as total_pageviews

    from cloud_page_views
    group by 1,2

),

daily_activity_docs_training as (

    select
      docs_training_page_views.date_day,
      docs_training_page_views.user_id,
      sum(docs_warehouse_pageviews) docs_warehouse_pageviews,
      sum(docs_tutorial_pageviews) docs_tutorial_pageviews,
      sum(docs_tutorial_pageviews) training_pageviews
    from docs_training_page_views
    group by 1,2

),

spined_users as (

    select
      all_days.date_day,
      first_and_last_activity.user_id

    from all_days
    join first_and_last_activity
          on all_days.date_day >= first_and_last_activity.first_activity_date
          and all_days.date_day <= dateadd(day, 30, first_and_last_activity.last_activity_date)

),

joined as (

    select
        spined_users.*,
        coalesce(total_pageviews,0) as total_pageviews,
        case when total_pageviews > 0 then 1 else 0 end as is_active,
        docs_warehouse_pageviews,
        docs_tutorial_pageviews,
        training_pageviews,
        case when docs_warehouse_pageviews > 0 then 1 else 0 end as is_active_docs_warehouse,
        case when docs_tutorial_pageviews > 0 then 1 else 0 end as is_active_docs_tutorial,
        case when training_pageviews > 0 then 1 else 0 end as is_active_training

    from spined_users
    left join daily_activity_cloud
        on spined_users.user_id =  daily_activity_cloud.user_id
        and spined_users.date_day = daily_activity_cloud.date_day
    left join daily_activity_docs_training
        on spined_users.user_id =  daily_activity_docs_training.user_id
        and spined_users.date_day = daily_activity_docs_training.date_day        

),

windowed as (

    select
        {{dbt_utils.generate_surrogate_key([
          'user_id',
          'date_day'
        ])}} as id,

        date_day,
        user_id,
        total_pageviews,
        is_active,

        docs_warehouse_pageviews,
        docs_tutorial_pageviews,
        training_pageviews,
        is_active_docs_warehouse,
        is_active_docs_tutorial,
        is_active_training,


        max(is_active) over (
            partition by user_id
            order by date_day
            rows between 6 preceding and current row
            ) as t7d_active,

        max(is_active) over (
            partition by user_id
            order by date_day
            rows between 29 preceding and current row
            ) as t30d_active

     from joined

)

select * from windowed
