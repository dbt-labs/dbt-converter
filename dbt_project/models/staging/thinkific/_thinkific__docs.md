{% docs src_thinkific %}
**Status: Active**

We use Thinkific to bring in dbt Learn: On Demand data and general Learner information.

Coap created this tap, you can view [the Tap's repo and README here](https://github.com/dbt-labs/tap-thinkific). This tap is deployed via Heroku with Stitch as a [target](https://app.stitchdata.com/client/102507/pipeline/connections/307892). Stitch then passes it on to Snowflake.

Coap and Drew know the most about the deployment and Coap knows how the tap that extracts the data. If you'd like to view the API documentation or see if other tables exist that we can bring in, please visit [Thinkific's API docs](https://developers.thinkific.com/api/api-documentation/).
{% enddocs %}