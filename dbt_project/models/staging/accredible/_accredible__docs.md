{% docs src_accredible %}
**Status:** Active

Accredible is the platform that we use to issue and manage dbt Credentials. The credentials include the dbt Fundamentals badge and the dbt Developer Certification. 

Data from this platform is extracted via a Singer Tap that is maintained by Elize Papineau. You can view [the Tap's repo and README here](https://github.com/dbt-labs/tap-accredible). The tap is deployed via Heroku with [Stitch as a target](https://app.stitchdata.com/client/102507/pipeline/v2/sources/416201/summary). Stitch then loads this data into Snowflake. Currently, this tap is designed to pull data 1x daily, with jobs set scheduled at 6AM UTC.

To view the API documentation for this data source, please visit [Accredibles's API docs](https://accrediblecredentialapi.docs.apiary.io/).

{% enddocs %}