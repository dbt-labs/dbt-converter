{% docs src_bizzabo %}
**Status:** Active

Bizzabo is an event experience platform that we use to run our virtual and hybrid events, like Coalesce. This tool allows us to manage event registrations, ticket sales, and live streaming. The data from this platform is used to inform us on how much interest there is in our events, what attendance looks like, engagement during the event, and how much revenue the event is bringing in.

Data from this platform is extracted via a Singer Tap that is maintained by Brandon Thomson. You can view [the Tap's repo and README here](https://github.com/dbt-labs/tap-bizzabo). The tap is deployed via Heroku with [Stitch as a target](https://app.stitchdata.com/client/102507/pipeline/v2/sources/396245/summary). Stitch then loads this data into Snowflake. Currently, this tap is designed to pull data 4x daily, with jobs set scheduled at 2AM, 2PM, 6PM, and 10PM UTC.

To view the API documentation for this data source, please visit [Bizzbo's API docs](https://bizzabo.stoplight.io/docs/bizzabo-rest-api/).

More information related to this data source can be found in the video below:
[Bizzabo Data Models Explanation in Loom](https://www.loom.com/share/01f24b7972ce4652b933c1d8f31eb4dc)
{% enddocs %}