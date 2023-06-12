with

all_days as (

    select * from {{ ref('all_days') }}

),

issues as (

    select 
        {{ dbt_utils.star(
            from=ref('fct_github_issues'),
            except=['CLOSED_AT']
        ) }},
        coalesce(closed_at, timestampadd(year, 1, current_date)) as closed_at
    from {{ ref('fct_github_issues') }}

),

issue_label_history as (

    select
        {{ dbt_utils.star(
            from=ref('int_issue_label_history'),
            except=['END_AT']
        ) }},
        coalesce(end_at, timestampadd(year, 1, current_date)) as end_at
    from {{ ref('int_issue_label_history') }}

),

date_spined as (

    select
        date_day,
        issues.*,
        {{ dbt_utils.star(
            from=ref('int_issue_label_history'),
            except=['ISSUE_ID'],
            relation_alias='issue_label_history'
        ) }},
        listagg(distinct label_name) over (
            partition by date_day, issues.issue_id
        ) as daily_labels

    from all_days
    left join issues
        on issues.created_at::date <= date_day
        and issues.closed_at::date >= date_day
    left join issue_label_history
        on issue_label_history.issue_id = issues.issue_id
        and issue_label_history.start_at::date <= date_day
        and issue_label_history.end_at::date >= date_day
    
    where date_day <= current_date

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'date_day',
            'repo_name',
            'change_type'
        ])}} as issue_status_count_id,
        date_day,
        repo_name,
        change_type,
        count(distinct
            case
                when is_triage_label
                 and end_at::date >= date_day
                    then issue_id
            end
        ) as needs_triage,
        count(distinct
            case
                when (is_team_label
                  or repo_name = 'dbt')
                 and closed_at > date_day
                    then issue_id
            end
        ) as assigned_to_team,
        count(distinct
            case
                when closed_at::date <= date_day
                    then issue_id
            end
        ) as closed,
        count(distinct
            case
                when repo_name = 'dbt-cloud'
                 and daily_labels not ilike '%Team:%'
                 and daily_labels not ilike '%triage%'
                    then issue_id
            end
        ) as not_assigned_to_team
    from date_spined 
    where repo_name in ('dbt', 'dbt-cloud')
    group by 1, 2, 3, 4

)

select * from final