with

source as (

    select * from raw.fivetran_greenhouse.job_history

),



synth as (

    select
    
        md5(cast(coalesce(cast(job_id as TEXT), '') || '-' || coalesce(cast(requisition_id as TEXT), '') || '-' || coalesce(cast(name as TEXT), '') || '-' || coalesce(cast(updated_at as TEXT), '') as TEXT)) as job_record_id,
        
        job_id,
        requisition_id,
        name as requisition_name,
        confidential as is_confidential,
        status,
        updated_at,
        closed_at

    from source

)


select * from synth