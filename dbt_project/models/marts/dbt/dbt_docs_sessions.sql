/* 
    It is possible to visit docs sites for multiple dbt projects within the same
    session. This occurs in ~1% of all sessions. In this model, we are going to perform
    a one-to-many join between identify events and sessions, knowing that the
    same `session_id` may now appear multiple times.
*/

with docs_events as (
    
    select * from {{ref('stg_dbt_docs_events')}}
    
),

sessions as (
    
    select * from {{ref('int_snowplow_sessions')}}
    
),

summarized as (
    
    select
        project_id,
        session_id,
        
        /*
            It's possible to visit docs sites from multiple jobs + runs, generated from
            the same dbt core project, all within the same session. A job ID indicates
            that the user viewed the primary documentation, linked from the left-hand
            sidebar. A run ID indicates that the user viewed docs from a specific run.
            
            Viewing docs for multiple dbt Cloud accounts, within the same session,
            generated from the same dbt core project, is unlikely. This is just to be safe.
        */
        max(database_source) as database_source,
        max(cloud_account_id) as cloud_account_id,
        max(cloud_job_id is not null) as viewed_primary_docs,
        max(cloud_run_id is not null) as viewed_specific_run_docs,
        max(cloud_develop_id is not null) as viewed_develop_docs
        
    from docs_events
    group by 1,2
    
),

joined as (
    
    select *,
        {{ dbt_utils.generate_surrogate_key([
            'project_id', 
            'session_id'
        ]) }} as id
    
    from summarized
    left join sessions using (session_id)
    
)

select * from joined
