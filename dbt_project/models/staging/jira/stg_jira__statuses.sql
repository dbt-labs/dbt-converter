with

statuses as (

    select * from {{ ref('base__jira_statuses') }}

),

status_categories as (

    select * from {{ ref('stg_jira__status_categories') }}

),

joined as (

    select 
       statuses.*,
       status_categories.status_category_name

    from statuses
    left join status_categories using (status_category_id)

)

select * from joined