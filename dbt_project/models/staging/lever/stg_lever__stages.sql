/*
    NOTE: If you add a new stage, please ensure you account for the indexing
    for Archived/Hired Stages in the fct_hiring_opportunities model
*/
with

source as (

    select * from {{ source('lever', 'stage') }}

),

renamed as (

    select
        id as stage_id,
        text as stage_name,

        case
            when stage_name in ('Task', 'Technical Interview')
                then 'Technical Interview'
            when stage_name in ('Reference Check', 'Background Check')
                then 'Post-Offer'
            else stage_name
        end as stage_bucketed,

        case
            when stage_name in ('Reached Out', 'Responded', 'New Lead', 'New Applicant', 'Reviewed')
                then '1. Pre-Pipeline'
            when stage_name = 'Check-In Call'
                then '3. Pre-Offer'
            when stage_name in ('Offer')
                then '4. Offer'
            when stage_name in ('Reference Check', 'Background Check')
                then '5. Post-Offer'
            else '2. Interviewing'
        end stage_pipeline,
        
        case
            when stage_name = 'New Lead'
                then 1
            when stage_name = 'Reached Out'
                then 2
            when stage_name = 'Responded'
                then 3
            when stage_name = 'New Applicant'
                then 4
            when stage_name = 'Reviewed'
                then 5
            when stage_name = 'TA Interview'
                then 6
            when stage_name = 'Hiring Manager Interview'
                then 7
            when stage_name = 'Task'
                then 8
            when stage_name = 'Technical Interview'
                then 9
            when stage_name = 'Panel Round Interview'
                then 10
            when stage_name = 'Final Interview'
                then 11
            when stage_name = 'Check-In Call'
                then 12
            when stage_name = 'Offer'
                then 13
            when stage_name = 'Background Check'
                then 14
            when stage_name = 'Reference Check'
                then 15
        end as stage_index,

       case
            when stage_bucketed = 'Technical Interview'
                then 8
            when stage_bucketed = 'Post-Offer'
                then 14
            else stage_index
        end as stage_bucketed_index

    from source

)

select * from renamed
