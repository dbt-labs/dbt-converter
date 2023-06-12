<!---------- MODEL DOCS ---------->

{% docs fct_arr_waterfall %}
This model contains all the logic for ARR waterfall feeding Corporate Finance Models
{% enddocs %}

{% docs fct_subscription_customer_arr_events %}
This model contains all the logic for ARR waterfall feeding Corporate Finance Models
{% enddocs %}

{% docs dim_finance_roster %}
This model contains all the logic Finance Roster feeding Corporate Finance Models.
The Finance Roster is the current roster of all planned seats, their financial impact, and their current status based on employees tied to job ids.
This model is built using the following sources: ADP, Greenhouse, SFDC, and Compensation data from Google Sheets.
{% enddocs %}

{% docs fct_managed_arr_forecast %}
This model produces the Managed ARR Forecast to feed all downstream finance models.
This is used primarily in Pigment.
{% enddocs %}

{% docs fct_arr_aggregated %}
This model contains 1 row per month and includes ARR from both Managed and Self-Serve customers.
Land, Expansion, Downsell, and Churn ARR for Managed customers for this model comes from Salesforce Opportunities data.
All other ARR in this model comes from the fct_arr_waterfall model.

{% enddocs %}

{% docs fct_customer_activity_self_serve %}
**Self-Service Customer Activity Movement**: Counts of `customer_id` field 
on `fct_arr_waterfall` ([dbt docs link](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_arr_waterfall)) 
for team (Self-Serve) customers.

This model contains 1 row per month, per customer, and only includes Self-Serve customers. 
The customer_activity_type field describes the customer's activity categorization for the month.

- **moved_channel_ss_to_mg** - moved to Managed plan within the month
- **land** - began paying us for the first time ever
- **churn** - stopped paying us during the month
- **contract** - was paying less at end of month than the beginning
- **expand** - was paying more at end of month than the beginning
- **reactivate** - had stopped paying for at least one day, then began paying again this month
- **return** - no change in amount paying between this month and previous month

{% enddocs %}

{% docs fct_customer_activity_managed %}
**Managed Customer Activity Movement**: Counts of `customer_id` field 
on `fct_opportunities` ([dbt docs link](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_opportunities)) 
for all closed won (or lost, for Renew), or currently open opportunities. `expected_arr_delta` is also used to identify customer movements.

**Managed Customer Activity Movement** is identified based on the `close_month` date of the related opportunity record.
This differs from the way Managed ARR is calculated, which uses the `contract_start_date` for all non-Land opportunities.
This means, for eample, a customer can be counted as an "Expand" customer in a different month 
than their ARR is counted amongst "Expand" ARR totals.

This model contains 1 row per month, per customer, per customer activity type, and only includes Managed customers. 
The `customer_activity_type` field describes the customer's activity categorization for the month.

#### Activity aka Movement Categories:
- **Land** - Customer is Net New to dbt Cloud, or moved from Self-Serve to Managed Plan
- **Expand** - Customer has a Closed Won Renew or Expand Opportunity where the expected Delta ARR is positive (> 0), 
meaning they are paying more than they were before
- **Renew** - Customer has a Closed Won Renew or Expand Opportunity where the expected Delta ARR is zero (= 0), 
meaning they are paying the same as they were before
- **Churn** - Customer has a Closed Lost Renew Opportunity
- **Downsell** - Customer has a Closed Won Renew Opportunity where the expected Delta ARR is negative (< 0), 
meaning they are paying less than they were before
- **Expected Churn** - Customer has an open Renew Opportunity that has a probability of zero, meaning they are expected to churn
- **Expected Downsell** - Customer has an open Renew Opportunity that has a positive probability (> 0), 
and the expected Delta ARR is negative (< 0), meaning they are likely to renew and to pay us less than before
- **Up for Expansion** - Customer has an open Expand opportunity that has a positive probability (> 0), 
and the expected Delta ARR is positive or zero (>= 0), meaning they may expand and are likely to pay us more than or the same as before
- **Up for Renewal** - Customer has an open Renew opportunity that has a positive probability (> 0), 
and the expected Delta ARR is positive or zero (>= 0), meaning they may renew and are likely to pay us more than or the same as before
- **Open Pipeline** - Customer has an open Land opportunity that has a positive probability (> 0), 
meaning they may become a Managed customer/move from Self-Serve to Managed

{% enddocs %}

{% docs fct_customer_activity_managed_quarterly_types %}
**Managed Customer Activity Movement by Quarter** is based on a hierarchical calculation:

- If a customer has an upsell / downsell opportunity and neither a cancel (aka churn) or land opportunity in the quarter, 
look at their net change in ARR for all opportunities in the quarter to determine where to bucket them 
(if < 0: downsell; if => 0: upsell) 

#### In order of precedence of the type:
- Land and/or Churn
- Expand & Downsell
- Renew
- Expected Churn
- Expected Downsell / Up for Expansion 
- Up for Renewal
- Open Pipeline

#### In practice, the logic should be:
- **Land and/or Churn**: include either, or both, records and exclude any others for this customer
- **Expand & Downsell**: based on sum of arr delta
- **Expand & anything below**: Expand
- **Downsell & anything below**: Downsell
- **Renew & anything below**: Renew
- **Expected Churn & anything below**: Epected Churn
- **Expected Downsell / Up for Expansion (& anything below)**: based on sum of arr delta (< 0 downsell; >= 0 expansion)
- **Up for Renewal and anything below**: Up for Renewal
- **Open Pipeline**: itself

{% enddocs %}
