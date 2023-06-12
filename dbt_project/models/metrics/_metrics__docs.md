{% docs okrs_fy23_daily %}
This is a daily snapshot of our FY23 OKRs, pulled from the Main FY23 OKR Googlesheet. This model gives us a view into our historical metrics as the googlesheet only allows us to see the current state of the world unless we go into each individual KR googlesheet. We use this model in Looker for KR owners to get a more holistic view.
{% enddocs %}

{% docs metrics_t7d %}
Past 7 days (today and the prior 6 days)
{% enddocs %}

{% docs metrics_t30d %}
Past 30 days (today and the prior 29 days)
{% enddocs %}

{% docs metrics_cm %}
Current month
{% enddocs %}

{% docs metrics_cq %}
Current quarter
{% enddocs %}

{% docs metrics_lm %}
Last month
{% enddocs %}

{% docs metrics_lq %}
Last quarter
{% enddocs %}

{% docs metrics_lytm %}
The same month last year
{% enddocs %}

{% docs metrics_lytq %}
The same quarter last year
{% enddocs %}

{% docs querying_dbt_metrics %}
## How to query this metric
### Option 1: Using dbt Metrics in Hex
- In the logic view click "Data" -> "dbt Metrics"
- Select the metric, time grain, date range, and dimensions.  
![querying-hex-metrics](assets/querying-hex-metrics.jpg "dbt Metrics in Hex")

### Option 2: in dbt Cloud IDE or Hex SQL cell
- Use the below SQL command, adjusting it for the relevant time grain & dimensions:
```sql
{% raw %}select * 
from {{ metrics.calculate(
    metric('account_signups'),
    grain='month',
    dimensions=['sign_up_source']
) }}{% endraw %}
```
{% enddocs %}