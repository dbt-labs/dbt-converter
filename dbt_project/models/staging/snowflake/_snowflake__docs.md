{% docs src_snowflake_account_usage %}
The [Account Usage](https://docs.snowflake.com/en/sql-reference/account-usage#label-account-usage-views)
schema of our production Snowflake instance. These sources are all materialized
as views by Snowflake and have varying latency depending on the view.
{% enddocs %}

{% docs src_snowflake_information_schema %}
The [Information Schema](https://docs.snowflake.com/en/sql-reference/info-schema)
schema of the `analytics` database in our production Snowflake instance. These
sources are all materialized as views by Snowflake.
{% enddocs %}

{% docs snowflake_tables %}
[Snowflake information_schema.tables view documentation](https://docs.snowflake.com/en/sql-reference/info-schema/tables).
Includes all Snowflake objects (tables and views) currently in the `analytics`
database.
{% enddocs %}

{% docs snowflake_query_history %}
[Snowflake query history view documentation](https://docs.snowflake.com/en/sql-reference/account-usage/query_history).
Latency for the view may be up to 45 minutes and data is retained for 1 year.
{% enddocs %}

{% docs snowflake_users %}
[Snowflake users view documentation](https://docs.snowflake.com/en/sql-reference/account-usage/users).
Latency for the view may be up to 120 minutes (2 hours).
{% enddocs %}

{% docs snowflake_warehouse_metering_history %}
[Snowflake warehouse metering history view documentation](https://docs.snowflake.com/en/sql-reference/functions/warehouse_metering_history).
Latency is not shared by Snowflake and data is retained for 6 months.
{% enddocs %}