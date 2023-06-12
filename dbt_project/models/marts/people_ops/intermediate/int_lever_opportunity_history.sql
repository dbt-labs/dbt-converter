with

opportunity_history as (

    select * from {{ ref('stg_lever__opportunity_stage_history') }}

),

stages as (

    select * from {{ ref('stg_lever__stages') }}

),

final as (

    select
        opportunity_history.opportunity_id,
        opportunity_history.stage_id,

        stages.stage_name,
        stages.stage_bucketed,
        stages.stage_pipeline,
        stages.stage_index,
        stages.stage_bucketed_index,

        opportunity_history.updated_at

    from opportunity_history
    left join stages
        on opportunity_history.stage_id = stages.stage_id

)

select * from final