{% docs src_caveon %}
**Status:** Scheduled daily

Caveon is a secure exam administration platform that we use to power our dbt certification program. This tool allows us to create exam items, monitor exam performance, and deliver the exam to candidates. The data from this platform is used to measure the success of the exam, the performance of exam items, and the number of certifications acheived by dbt partners.

Data from this platform is extracted via a Singer Tap that is maintained by Elize Papineau. You can view [the Tap's repo and README here](https://github.com/dbt-labs/tap-caveon). The tap is deployed via Heroku with [Stitch as a target](https://app.stitchdata.com/client/102507/pipeline/v2/sources/414648/summary). Stitch then loads this data into Snowflake. This tap is deployed in a private Heroku team due to the sensitive nature of the data the API key has access to.

To view the API documentation for this data source, please visit [Caveon's API docs](https://sei.caveon.com/api).
{% enddocs %}

{% docs caveon__exam_deliveries %}
The collection of exam delivery objects. A delivery is a specific instance of an examinee taking the exam.
{% enddocs %}

{% docs caveon__exam_delivery_item_responses %}
The collection of item_response objects for each delivery.
{% enddocs %}

{% docs caveon__exam_items %}
The collection of items for an exam.
{% enddocs %}

{% docs caveon__exams %}
The collection of exams. A caveon admin can add additional exams by 
adding the 'Singer' application as an extension.
{% enddocs %}

{% docs caveon__users %}
The collection of caveon users.
{% enddocs %}
