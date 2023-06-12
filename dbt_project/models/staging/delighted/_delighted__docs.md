{% docs src_delighted %}

We use Delighted to track some customer feedback across our products and services.
Currently, we only track:
- dbt Fundamentals on demand NPS (Thinkific)
- support ticket CSAT (Zendesk)
- professional services CSAT (ProServ)
With this data source, we can track the questions we ask, responses, and who responded.

For active sources, Fivetran runs an extraction every 6 hours. To understand how
these staging models connect with each other, check out
[Fivetran's Delighted ERD](https://docs.google.com/presentation/d/1cDQqD44yAFi5WsZp3vsZPgIbw3DD0LTjzL2sZA72wdk/edit#slide=id.g4859b69cdd_0_917). 
If you'd like to add another Delighted customer feedback form, please alert the Data Team in #internal-analytics.

{% enddocs %}