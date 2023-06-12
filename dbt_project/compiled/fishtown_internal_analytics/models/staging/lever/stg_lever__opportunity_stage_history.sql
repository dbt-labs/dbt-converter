with source as (

    select * from raw.fivetran_lever.opportunity_stage_history

),

renamed as (

    select
        md5(cast(coalesce(cast(opportunity_id as TEXT), '') || '-' || coalesce(cast(stage_id as TEXT), '') as TEXT)) as opportunity_history_id,
        opportunity_id,
        stage_id,

        max(updated_at) as updated_at

    from source
    group by 1, 2, 3

)

select * from renamed