{{
  config(
    materialized = 'table'
  )
}}

with

issue_label_history as (

    select * from {{ ref('base__github_issue_label_history') }}

),

labels as (

    select * from {{ ref('stg_github__labels') }}

),

joined as (

    select
        {{ dbt_utils.star(
            from=ref('base__github_issue_label_history'),
            except=['LABEL_NAME'],
            relation_alias='issue_label_history'
        ) }},
        /* We have to coalesce these fields becasue there is inconsistency with
        how these are tracked. Some records have the `label_name` while others
        need to be joined to the label table. It's unclear what's causing this
        inconsistency so the best option here is to join it at the staging 
        table. Not all labels have a `label_id`.*/
        coalesce(labels.label_name, issue_label_history.label_name) as label_name

    from issue_label_history

    left join labels
        on labels.label_id = issue_label_history.label_id

),

dedupe as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'issue_id',
            'label_name',
            'updated_at'
        ])}} as issue_label_history_id,
        *
    
    from joined
    qualify row_number() over (
        partition by issue_id, label_name, updated_at
        order by label_id
    ) = 1

),

final as (

    select
        *,
        label_name = 'triage' as is_triage_label,
        label_name = 'ready_for_review' as is_review_label,
        label_name = 'introduced-bug' as is_merge_failure_label,
        label_name ilike 'Team:%' as is_team_label,
        lower(trim(split_part(label_name, ':', 2))) as team
    
    from dedupe
)

select * from final