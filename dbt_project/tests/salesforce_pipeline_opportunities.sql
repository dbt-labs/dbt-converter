-- This test logic is built in the `export_test_salesforce_pipeline_opportunities` export model
-- We do this because we have a notification setup to alert the ops team of test failures via Hightouch

{{ config(severity = 'warn') }}

with opps_test as (

    select * from {{ ref('export_test_salesforce_pipeline_opportunities') }}

)

select * from opps_test