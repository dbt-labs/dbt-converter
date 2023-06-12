{% docs src_dbt_cloud_admin %}
**Status:** Scheduled daily

dbt Cloud is a hosted IDE and orchestration platform for dbt :stuck_out_tongue_winking_eye:. The data from the dbt Cloud admin API will be used to identify common patterns in our dbt Cloud environments and job runs. To ingest [additional endpoints](https://dbtc.dpguthrie.com/0.4/guide/intro/), work directly with Elize to update the Fivetran Function.

Data from this platform is extracted via a custom Fivetran Function that is maintained by Elize Papineau. The [function's repo](https://github.com/dbt-labs/fivetran-function-dbt-cloud) is in a `TODO` state pending broader decisions about our custom ingestion framework. The function tap is deployed via AWS Lambda function which is triggered by the Fivetran connector. Fivetran then loads the response data into Snowflake.

To view the API documentation for this data source, please visit [dbt Cloud's API docs](https://docs.getdbt.com/dbt-cloud/api-v2).
{% enddocs %}

{% docs dbt_cloud_admin_environments %}
List of environments for a specific account.
{% enddocs %}

{% docs dbt_cloud_admin_jobs %}
List of jobs in an account or specific project.
{% enddocs %}

{% docs dbt_cloud_admin_runs %}
List of runs in an account.
{% enddocs %}