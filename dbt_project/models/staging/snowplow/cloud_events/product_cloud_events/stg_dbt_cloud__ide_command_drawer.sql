{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

with events as (
  
  select
    event_at,
    event_name,
    event_id,
    unstruct_event:data:data:initiated_by::varchar as click_or_enter,
    unstruct_event:data:data:menu_section::varchar as command_drawer_section,
    coalesce(unstruct_event:data:data:selected_command::varchar, unstruct_event:data:data:current_command::varchar) as selected_command
  from {{ ref('stg_dbt_cloud_ide_events') }}
  -- these events did not exist before April 10th, 2021
  where event_at > '2021-04-10'
    and event_name in (
      'ide_command_drawer_select_item',
      'ide_command_drawer_dismiss'
    )

  ),
  
final as (  

  select 
    *,
    split_part(selected_command, ' ', 2) as selected_command_category
  from events

  )
  
select * from final