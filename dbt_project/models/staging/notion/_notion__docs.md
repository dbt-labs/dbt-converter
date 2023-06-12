{% docs src_notion %}
**Status:** Active

Notion is where information about our business lives. Some business critical information is stored in Notion databases. This is a more accessible way to keep data dynamically-updatable than Google Sheets (which have a Fivetran connector available).

Data from this platform is extracted via a Singer Tap that is maintained by Elize Papineau. You can view [the Tap's repo and README here](https://github.com/dbt-labs/tap-notion). The tap is deployed via Heroku with [Stitch as a target](https://app.stitchdata.com/client/102507/pipeline/v2/sources/420088/summary). Stitch then loads this data into Snowflake.

To view the API documentation for this data source, please visit [Notion's API docs](https://developers.notion.com/reference/intro).
{% enddocs %}