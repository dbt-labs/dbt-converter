with 

core_usage as (

    select * from {{ref('int_core_run_metrics')}}

),

mappings as (

    select * from {{ref('int_core_run_account_mappings')}}

),

joined as (

    select
        core_usage.*,
        mappings.cloud_account_id
    from core_usage
    inner join mappings
    on core_usage.inferred_project_id = mappings.inferred_project_id
    and core_usage.invocation_id = mappings.invocation_id

),

final as (

    select 
        {{ dbt_utils.generate_surrogate_key([
          'project_rank_id_sk',
          'cloud_account_id'
        ]) }} as unique_id_sk,
        *
    from joined

)

select * from final