with source as (

    select * from {{ source('lever', 'opportunity_stage_history') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'opportunity_id',
            'stage_id'
        ])}} as opportunity_history_id,
        opportunity_id,
        stage_id,

        max(updated_at) as updated_at

    from source
    group by 1, 2, 3

)

select * from renamed
