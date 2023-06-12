{{
  config(
    materialized = 'table'
  )
}}

with

issue_links as (

    select * from {{ ref('base__jira_issue_links') }}

),

issues as (

    select * from {{ ref('stg_jira__issues') }}

),

joined as (
    
    select 
        issue_links.*,
        issues.issue_key as related_issue_key,
        issues.issue_name as related_issue_name,
        issues.issue_description as related_issue_description,
        issues.due_date as related_issue_due_date
        
    from issue_links
    left join issues
        on issue_links.related_issue_id = issues.issue_id

)

select * from joined