with 
  
invocations as (
  
    select * from {{ ref('fct_dbt_invocations') }}

),

daily_mappings as (

    select * from {{ ref('int_dbt_adapter_project_account_mappings') }}

),

to_exclude as (  --"problem children" adapter_unique_ids

    select distinct
        adapter_unique_id
    from invocations
    where cloud_account_id = '1' -- dbt Labs, or a ST incorrectly mapped to MT
        or adapter_unique_id in (
        '421aa90e079fa326b6494f812ad13e79', -- localhost
        'f528764d624db129b32c21fbca0cb8d6', -- 127.0.0.1, aka localhost
        '7ff6891c5052eea73d5137809d8ab4fe', -- a dbt Labs sandbox
        '1f8e84f07fed5a42e00131e6243ce532', -- another dbt Labs sandbox
        'b0123f856d362fa4c36a565319ba65e1'  -- a ST incorrectly mapped to MT
        )
),

invocations_filtered as (

    select 
        *
    from invocations 
    where adapter_unique_id is not null
        and distribution = 'core'
        and command in ('build','run')

),

invocations_cleaned as (

    --remove "problem children" adapter_unique_ids with an antijoin
    --antijoin: https://stackoverflow.com/questions/42643542/query-to-exclude-rows-whose-id-is-listed-in-another-table

    select 
        invocations_filtered.*,
        started_at::date as date_day 
    from invocations_filtered
    left join to_exclude 
        on invocations_filtered.adapter_unique_id = to_exclude.adapter_unique_id
    where invocations_filtered.adapter_unique_id is not null 
    and to_exclude.adapter_unique_id is null

),

daily_mappings_enhanced as (

    select
        date_day,
        adapter_unique_id,
        inferred_project_id,

        --On days in which there were no cloud runs for the related adapter_unique_id,
        --the cloud_account_id will be null for that day <-> adapter_unique_id pair.
        --The following is used to fill in those nulls with the most recent cloud_account_id 
        --that the adapter_unique_id was connected to. In some cases, this will create
        --duplicate records, which we clean up in the next CTE.

        lag(cloud_account_id) ignore nulls over (partition by adapter_unique_id order by date_day) as cloud_account_id
        from daily_mappings
    order by 1

),

daily_mappings_deduped as (

    select distinct
        *
    from daily_mappings_enhanced

),

joined as (

    select
        invocations_cleaned.invocation_id,
        invocations_cleaned.adapter_unique_id,
        invocations_cleaned.inferred_project_id,
        daily_mappings_deduped.cloud_account_id
    from invocations_cleaned
    inner join daily_mappings_deduped
    on invocations_cleaned.inferred_project_id = daily_mappings_deduped.inferred_project_id
        and invocations_cleaned.adapter_unique_id = daily_mappings_deduped.adapter_unique_id
        and invocations_cleaned.date_day = daily_mappings_deduped.date_day

),

final as (

    select 
        {{ dbt_utils.generate_surrogate_key([
          'invocation_id',
          'cloud_account_id'
        ]) }} as mapping_id_sk,
        *
    from joined
    where cloud_account_id is not null

)

select * from final
