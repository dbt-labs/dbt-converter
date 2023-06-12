with

applications as (

    select * from {{ source('greenhouse', 'application') }}
    where _fivetran_deleted = false

),

synth as (

    select 
        applications.id as application_id,
        applications.candidate_id,
        applications.job_post_id,
        applications.applied_at,
        applications.rejected_at,
        applications.last_activity_at,
        applications.status as application_status,
        applications.credited_to_user_id,
        applications.current_stage_id,
        applications.prospect_owner_id,
        applications.prospect as is_prospect,
        applications.source_id

    from applications

)


select * from synth