with

opportunities as (

    select * from {{ ref('stg_lever__opportunities') }}

),

opportunity_history as (

    select * from {{ ref('int_lever_opportunity_history') }}

),

postings as (

    select * from {{ ref('stg_lever__postings') }}

),

applications as (

    select * from {{ ref('stg_lever__applications') }}

),

users as (

    select * from {{ ref('stg_lever__users') }}

),

archive_reasons as (

    select * from {{ ref('stg_lever__archive_reasons') }}

),

joined as (

    select
        opportunities.*,
        applications.posting_id,
        hiring_manager.user_name as hiring_manager_name,
        posting_owner.user_name as owner_name,

        postings.role_title,
        postings.team_name as team_name,
        postings.role_location,
        postings.role_level,

        archive_reasons.archive_reason,
        case
            when archive_reason = 'Hired'
                then 1
            else 0
        end as was_hired,

        case
            when is_archived and was_hired = 0
                then 'Archived'
            when is_archived and was_hired = 1
                then 'Hired'
            else opportunity_history.stage_name
        end as current_stage_name,

        case
            when is_archived
                then current_stage_name
            else opportunity_history.stage_bucketed
        end as stage_bucketed,

        case
            when current_stage_name = 'Hired'
                then '6. Hired'
            when current_stage_name = 'Archived'
                then '7. Archived'
            else opportunity_history.stage_pipeline
        end as stage_pipeline,

        case
            when current_stage_name = 'Hired'
                then 16
            when current_stage_name = 'Archived'
                then 17
            else opportunity_history.stage_index
        end as stage_index,

        case
            when current_stage_name = 'Hired'
                then 15
            when current_stage_name = 'Archived'
                then 16
            else opportunity_history.stage_bucketed_index
        end as stage_bucketed_index,

        case
            when is_archived 
                then opportunity_history.stage_name
        end as stage_name_before_archived

    from opportunities
    left join opportunity_history 
        on opportunities.opportunity_id = opportunity_history.opportunity_id
        and opportunities.stage_id = opportunity_history.stage_id
    left join applications
        on opportunities.opportunity_id = applications.opportunity_id
    left join postings
        on applications.posting_id = postings.posting_id
    left join users as hiring_manager
        on postings.owner_id = hiring_manager.user_id
    left join users as posting_owner
        on postings.owner_id = posting_owner.user_id
    left join archive_reasons
        on opportunities.archive_reason_id = archive_reasons.archive_reason_id

),

enriched as (

    select
        *,
        case
            when not is_archived then
                datediff(
                    day,
                    last_interaction_at,
                    current_date()
                )
        end as days_since_last_interaction,

        case
            when not is_archived then
                datediff(
                    day,
                    created_at,
                    current_date()
                )
            else 
                datediff(
                    day,
                    created_at,
                    archived_at
                )
        end as days_in_pipeline

    from joined

)

select * from enriched
