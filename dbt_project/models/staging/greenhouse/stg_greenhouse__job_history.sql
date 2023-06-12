with

source as (

    select * from {{ source('greenhouse', 'job_history') }}

),



synth as (

    select
    
        {{ dbt_utils.generate_surrogate_key([
            'job_id',
            'requisition_id',
            'name',
            'updated_at'
        ]) }} as job_record_id,
        
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