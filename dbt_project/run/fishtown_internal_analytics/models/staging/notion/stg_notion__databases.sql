
  create or replace   view analytics_dev.dbt_jstein.stg_notion__databases
  
   as (
    with 

source as (

    select * from raw.notion.query_databases

),

final as (


    select
        parent:database_id::string as notion_database_id,
        id as notion_database_row_id,
        properties as notion_database_row,
        
        -- Notion doesn't mark rows as deleted
        -- instead, we need to rely on when Stitch receives the latest version of the database
        -- and compare that to the max timestamp for that database
        -- if the received at value is less than the max, this signals the row no longer exists
        _sdc_received_at < max(_sdc_received_at) over (partition by notion_database_id) as is_deleted

    from source

)

select * from final
  );

