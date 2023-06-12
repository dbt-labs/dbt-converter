{% docs src_heysummit %}
**Status:** Inactive

The events & marketing teams use HeySummit to host our virtual events. The data provided by this platform includes event & talk information, as well as attendee registration details. Currently, we are only using HeySummit for Coalesce.

Brandon Thomson created this tap, you can view [the Tap's repo and README here](https://github.com/dbt-labs/tap-heysummit). This tap is deployed via Heroku with Stitch as a [target](https://app.stitchdata.com/client/102507/pipeline/connections/361094/summary). Stitch then passes it on to Snowflake.

To view the API documentation for this data source, please visit [HeySummit's API docs](https://api-docs.heysummit.com/#introduction).
{% enddocs %}