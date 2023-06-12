{{
    config(
        severity='warn'
    )
}}

{% set connector_exclusions = (
    'fivetran_st_singletenant_staging',
    'fivetran_st_singletenant_azure_staging',
    'fivetran_st_cambia_uat',
    'fivetran_st_natwest_prod',
    'fivetran_st_natwest_dev'
) %}

{% set query %}

/*
    This test is responsible for checking whether our single-tenant sources
    have been synced successfully within the last day. It's meant to serve as
    a proxy or replacement for source freshness tests because we don't load
    every single-tenant instance as a source, instead we dynamically union
    them in our cloud_postgres staging tables.

    We are using fivetran logs here because usage behaviours of single-tenant
    customers vary widely and we don't expect every customer to have consistent
    daily usage. Instead, we test here whether a sync was successful which gives
    us enough confidence that this data is up to date. In the event where
    someone suspects there is something wrong with the data, and this test has
    not failed, it is possible that the issue is at the original source database
    and would not be a function of the fivetran sync failing.
*/

with

fivetran_logs as (

    select * from {{ ref('stg_fivetran_log__logs') }}

),

fivetran_connectors as (

    select * from {{ ref('stg_fivetran_log__connectors') }}

),

shortlist_logs as (

    /*
        This section takes the fivetran "status" log events. This would tell us
        whether a sync has failed or succeeded and the timestamp of that last
        sync. We also filter here on only our single-tenant connnectors so that
        we don't scan the whole logs table in its entirety. Lastly, we also have
        an exclusion filter that removes connections we already know will fail
        because they have been deprecated. The exclusion filter allows us to
        dynamically add new sources without requiring code changes all the time.
    */

    select 
        fivetran_logs.*,
        fivetran_connectors.connector_name,
        substr(fivetran_connectors.connector_name, 13) as st_sources
    from fivetran_logs
    left join fivetran_connectors
        on fivetran_connectors.connector_id = fivetran_logs.connector_id
    where message_event = 'status'
      and fivetran_connectors.connector_name ilike 'fivetran_st_%'
      and fivetran_connectors.connector_name not in {{ connector_exclusions }}

),

flattened_logs as (

    /*
        This section takes the shortlisted logs above and takes the last record
        of a successful sync. This will result in having 1 record for every
        single-tenant source we sync. We can then use this timestamp to compare
        with the current date and know which connections have fallen behind and
        raise a failure on the test.
    */


    select 
        shortlist_logs.*,
        sync_status.value::varchar as sync_status
    from shortlist_logs,
        lateral flatten(input => shortlist_logs.message_data) as sync_status
    where sync_status.path = 'status'
    and sync_status = 'SUCCESSFUL'
    
    qualify row_number() over (
        partition by connector_id 
        order by event_timestamp_at desc
    ) = 1

)

select
    st_sources,
    event_timestamp_at as last_synced_at
from flattened_logs
where datediff(hour, event_timestamp_at, current_date()) > 36

{% endset %}

{{ query }}

{% set results = run_query(query) %}

    /*
        This section will print the sources that are delayed straight into the
        logs so we don't have to scan test results to know which source is out
        of date!
    */


{% if execute %}

    {% if results is not none %}
        
        {% do results.print_table() %}
    
    {% endif %}
  
{% endif %}

