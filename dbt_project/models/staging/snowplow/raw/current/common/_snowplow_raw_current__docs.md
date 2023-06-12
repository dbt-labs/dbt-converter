{% docs _loaded_at %}
The timestamp at which the snowplow enrichment process completes and data is loaded into Snowflake. This has been set up as
the key timestamp for incremental logic in the Snowplow-related models, as the collector timestamp that was previously used 
occasionally resulted in data gaps after latency periods, given that the data collection timestamps were often prior to the latency.
{% enddocs %}