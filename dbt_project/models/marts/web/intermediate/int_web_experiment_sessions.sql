with

page_views as (

    select * from {{ ref('int_snowplow_page_views') }}

),

grouped as (
    -- We are using the max experiment & branch names to ensure we grab any variants that a user was exposed to
    -- across website sessions. Essentially, are variants are prefixed with v_ so they would show up in if exposed
    -- this is compared to 'main' which is our control
    -- In the future this logic very well might change, but for now it ensures we capture variant exposure across the entire session
    select
        session_id,
        max(experiment_name) as experiment_name,
        max(branch_name) as branch_name

    from page_views
    group by 1

)

select * from grouped