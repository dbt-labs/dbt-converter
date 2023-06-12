with

sessions as (

    select * from analytics_dev.dbt_jstein.fct_web_sessions
    where first_page_url_host in ('getdbt.com', 'www.getdbt.com', 'blog.getdbt.com', 'docs.getdbt.com')

)

select * from sessions