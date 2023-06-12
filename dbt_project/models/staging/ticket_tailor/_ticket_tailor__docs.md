{% docs src_ticket_tailor %}
**Status: Active**

We use Ticket Tailor to pull in public dbt Learn attendance and Learners.

Drew created this tap, you can view [the Tap's repo and README here](https://github.com/dbt-labs/tap-tickettailor). This tap is deployed via Heroku with Stitch as a [target](https://app.stitchdata.com/client/102507/pipeline/connections/272622/summary). Stitch then passes it on to Snowflake.

Drew know the most about the deployment and how the tap that extracts the data. If you'd like to view the API documentation or see if other tables exist that we can bring in, please visit [Ticket Tailor's API docs](https://developers.tickettailor.com/).
{% enddocs %}