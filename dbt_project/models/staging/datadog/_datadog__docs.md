{% docs src_datadog %}
**Status:** Scheduled daily

Datadog is a cloud application observability tool that we use to monitor the dbt Cloud service. The data from this platform is used to measure application availability for reporting. To ingest additional types of data, add the appropriate query to [datadog_queries.json](https://github.com/dbt-labs/fivetran-function-datadog/blob/main/fivetran_function_datadog/datadog_queries.json).

Data from this platform is extracted via a custom Fivetran Function that is maintained by Elize Papineau. You can view [the function's repo and README here](https://github.com/dbt-labs/fivetran-function-datadog). The function tap is deployed via AWS Lambda function which is triggered by the Fivetran connector. Fivetran then loads the response data into Snowflake.

To view the API documentation for this data source, please visit [Datadog's metrics query API docs](https://docs.datadoghq.com/api/latest/metrics/#query-timeseries-points).
{% enddocs %}

{% docs datadog_total_requests %}
The total requests logged in the Datadog instance. The grain of this value is controlled by the `.rollup()` values defined in the Datadog query. The current grain is 24 hours.
{% enddocs %}

{% docs datadog_error_requests %}
The total 5** responses to requests logged in the Datadog instance.
{% enddocs %}