{{ config(
    materialized = 'incremental',
    unique_key = 'event_id'
) }}

with events as (

    select * from {{ ref('current_snowplow_experimental_parser') }}
    
    {% if is_incremental() %}
        where _loaded_at > (select dateadd(day, -1, max(_loaded_at)) from {{ this }})
    {% endif %}
    
    qualify row_number() over (partition by event_id order by _loaded_at desc) = 1

),

invocations as (

    select * from {{ ref('fct_dbt_invocations') }}

),

summarized as (

    select *,
        
        left(parser_status_array[0], 2) as first_code,
        case
          when first_code in ('00','80')                     then 'exact_match'
          when first_code in ('01','81')                     then 'cannot_parse'
          when first_code in ('02','03','04','05','06','07') then 'experimental_mismatch'
          when first_code in ('82','83','84','85','86','87') then 'stable_mismatch'
          when first_code in ('08','88')                     then 'disabled'
          when first_code in ('09','89')                     then 'skipped'
          else 'other'
        end as parser_status_summary

    from events

),

joined as (

    select

        summarized.*,
        invocations.dbt_version,
        invocations.started_at

    from summarized
    join invocations
      on summarized.invocation_id = invocations.invocation_id

)

select * from joined
