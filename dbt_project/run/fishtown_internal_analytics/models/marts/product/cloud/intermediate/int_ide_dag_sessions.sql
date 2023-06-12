
  create or replace   view analytics_dev.dbt_jstein.int_ide_dag_sessions
  
   as (
    with

dag_starts as (

    select * from analytics_dev.dbt_jstein.stg_dbt_cloud__ide_dag_view_starts

),

dag_requests as (

    select * from analytics_dev.dbt_jstein.stg_dbt_cloud__knowledge_layer_requests

),

dag_renders as (

    select * from analytics_dev.dbt_jstein.stg_dbt_cloud__ide_dag_renders

),

dag_interactions as (

    select * from analytics_dev.dbt_jstein.stg_dbt_cloud__ide_node_interactions

),

final as (

    select
        dag_starts.ide_dag_view_start_id,
        dag_starts.database_source,
        dag_starts.develop_request_id,
        dag_starts.tenant_develop_request_id,
        dag_starts.event_at as dag_session_start_at,
        dag_starts.view_name as dag_view_name,
        
        -- requests
        min(dag_requests.event_at) as first_request_at,
        max(dag_requests.event_at) as last_request_at,
        count(distinct dag_requests.dag_knowledge_layer_request_id) as count_requests,
        max(dag_requests.timing_in_ms) as max_request_timing_in_ms,
        sum(dag_requests.timing_in_ms) as total_request_timing_in_ms,
        
        -- renders
        count(distinct dag_renders.ide_dag_render_id) as count_renders,
        max(dag_renders.layout_timing) as max_layout_timing_in_ms,
        sum(dag_renders.layout_timing) as total_layout_timing_in_ms,
        max(dag_renders.render_timing) as max_render_timing_in_ms,
        sum(dag_renders.render_timing) as total_render_timing_in_ms,
        
        -- interactions
        count(distinct dag_interactions.ide_dag_node_interaction_id) as count_interactions

    
    from dag_starts
    left join dag_requests using (context_id)
    left join dag_renders using (request_id)
    left join dag_interactions using (request_id)

    group by 1,2,3,4,5,6

)

select * from final
  );

