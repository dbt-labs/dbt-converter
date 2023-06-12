with

opportunity_history as (

    select * from {{ ref('int_lever_opportunity_history') }}

),

opportunities as (

    select * from {{ ref('fct_hiring_opportunities') }}

),

joined as (

    select
        opportunity_history.opportunity_id,

        opportunities.team_name,
        opportunities.owner_name,

        opportunity_history.stage_name,
        opportunity_history.stage_bucketed,
        opportunity_history.stage_pipeline,
        opportunity_history.stage_index,
        opportunity_history.stage_bucketed_index,

        opportunities.current_stage_name,
        opportunities.stage_bucketed as current_stage_bucketed,
        opportunities.stage_pipeline as current_stage_pipeline,
        opportunities.stage_index as current_stage_index,
        opportunities.stage_bucketed_index as current_stage_bucketed_index,

        opportunity_history.updated_at,
        opportunities.is_archived,
        opportunities.archived_at

    from opportunity_history
    left join opportunities
        on opportunity_history.opportunity_id = opportunities.opportunity_id

),

unioned as (
--bring in a stage for archived opportunity events
    select
        opportunity_id,
        team_name,
        owner_name,
        stage_name,
        stage_bucketed,
        stage_pipeline,
        stage_index,
        stage_bucketed_index,
        updated_at

    from joined

    union all

    select
        opportunity_id,
        team_name,
        owner_name,
        current_stage_name as stage_name,
        current_stage_bucketed as stage_bucketed,
        current_stage_pipeline as stage_pipeline,
        current_stage_index as stage_index,
        current_stage_bucketed_index as stage_bucketed_index,
        archived_at as updated_at

    from joined
    qualify row_number() over (
        partition by opportunity_id
        order by updated_at desc) = 1
    and is_archived

),

enriched as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'opportunity_id',
            'stage_name'
        ])}} as event_id,
        *,
        case
            when stage_name not in ('Archived', 'Hired') then
                datediff(
                    day,
                    updated_at,
                    coalesce(
                        lead(updated_at) over (
                        partition by opportunity_id
                        order by updated_at),
                        current_date())
                            --if they are currently in this stage,
                            --then use the current date 
                            --(otherwise it'll be null)
                    )
         end as days_in_stage,

        case
            when lead(stage_name) over (
                partition by opportunity_id
                order by updated_at) != 'Archived'
                    then 1
            when lead(stage_name) over (
                partition by opportunity_id
                order by updated_at) = 'Archived'
                    then 0
        end as moved_to_next_round

    from unioned

)

select * from enriched