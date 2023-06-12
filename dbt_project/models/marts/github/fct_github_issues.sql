with issues as (

    select

        {{ dbt_utils.star(
            from=ref('int_github_issues'),
            except=['pull_request_number', 'first_marked_for_review_at']
        ) }}
            
    from {{ ref('int_github_issues') }}
    where is_pull_request = false
    
    /*
      GitHub API + Fivetran have no way to demarcate "transferred" issues
      If an issue has been transferred to a different repo, there will exist
      multiple issues with identical body text, but only the latter
      will get updates for events that happen post-transfer.
      For now, choose the one with more recent updates (i.e. the one in the new repo).
      While this prevents the old issue from appearing as if it "needs_triage",
      this has the effect of removing the new issue from any triage considerations.
      Let's revisit this modeling in the future.
    */
    
    qualify row_number() over (
      partition by body
      order by updated_at desc
    ) = 1
    -- don't try deduping issues with no `body` text
    or nullif(body, '') is null

),

issue_label_history as (

    select * from {{ ref('int_issue_label_history') }}

),

change_types as (
    /* This CTE flattens the different issue labels and flags whether an 
    issue has a bug or enhancement label. Using boolor_agg seems to be the
    easiest way to flatten multiple labels into a single boolean for each 
    issue. */

    select
        issue_id,
        boolor_agg(label_name = 'bug') as is_bug,
        boolor_agg(label_name = 'enhancement') as is_enhancement,
        boolor_agg(label_name in ('duplicate', 'wontfix')) as is_wontfix,
        boolor_agg(label_name in ('stale', 'good_first_issue', 'help_wanted')) as is_icebox
    
    from issue_label_history
    where end_at is null
    
    group by 1

),

joined as (
  
    select
    
        issues.*,
        case
            when change_types.is_bug
                then 'bug'
            when change_types.is_enhancement
                then 'enhancement'
        end as change_type,
        case
            when change_types.is_wontfix
                then 'wontfix'
            when change_types.is_icebox
                then 'icebox'
        end as priority
        
    from issues
    left join change_types
        on issues.issue_id = change_types.issue_id

),

final as (

    select
        *,
        case
            when priority = 'icebox'
                then 'icebox'
            when priority = 'wontfix'
                then 'wontfix'
            when closed_at is not null
                then 'closed'
            when marked_for_triage_count > triage_count
                then 'needs_triage'
            when team is not null
                then 'assigned_to_team'
            when last_triaged_at is not null
              or (
                    first_marked_for_triage_at is null
                    and team is null
              ) 
                then 'not_assigned_to_team'
        end as issue_status
    
    from joined

)

select * from final
