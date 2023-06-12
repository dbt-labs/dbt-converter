begin;
    

    insert into analytics_dev.dbt_jstein.current_snowplow_web_page ("_SOURCE", "_LOADED_AT", "EVENT_ID", "ID")
    (
        select "_SOURCE", "_LOADED_AT", "EVENT_ID", "ID"
        from analytics_dev.dbt_jstein.current_snowplow_web_page__dbt_tmp
    );
    commit;