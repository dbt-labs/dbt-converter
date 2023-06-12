with 
  
invocations as (
  
    select * from {{ ref('fct_dbt_invocations') }}
    where adapter_unique_id is not null

),

adapter_account_days as (
  
    select distinct
        started_at::date as date_day,
        adapter_unique_id,
        project_id,
        inferred_project_id,
        cloud_account_id
    from invocations
  
),

final as (

    select
        {{ dbt_utils.generate_surrogate_key([
                'date_day',
                'adapter_unique_id',
                'project_id',
                'inferred_project_id',
                'cloud_account_id'
        ]) }} as mapping_id_sk,
        date_day,
        adapter_unique_id,
        project_id,
        inferred_project_id,
        cloud_account_id
    from adapter_account_days

)

select * from final
