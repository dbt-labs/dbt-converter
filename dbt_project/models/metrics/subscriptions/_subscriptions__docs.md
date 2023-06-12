{% docs forecasting_mrr %}
Total revenue generated from active subscriptions in a given month

## Calculations
**Sources:**
* **in dbt:** [fct_subscription_transactions](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_subscription_transactions)
* **in Looker:** [Subscriptions explore](https://fishtown.looker.com/explore/dbtLabs/subscription_transactions)

**Formulas:**
* **Self-Service MRR:** Total Revenue
    * category = dbt_cloud
    * sales_motion = 'Self-Service'
* **Managed MRR:** Total Revenue (contract value / months in contract)
    * category = dbt_cloud
    * sales_motion = 'Enterprise'
* **MRR:** `Self-Service MRR + Managed MRR`
* **% Accuracy:** `(Total Revenue (MRR) - Forecasted MRR) / Forecasted MRR`
## Resources
* [Link to Data Asset]()
* [Link to Googlesheet](https://docs.google.com/spreadsheets/d/1ulle6mm2y7jV3fvXkTcxmVa528EMVwMrS92xsEHM_80/edit?usp=drive_web&ouid=115307629368660313079)
* [Link to OKR Doc](https://www.notion.so/O3-Improve-business-predictability-f27543a1cef5409b94c9bb8d7a71afa2)

## Historical

### Fiscal Year 2023 Overview
* **Fiscal Year:** 2023
* **Company Objective:** O3. Improve business predictability
* **Company KR #:** 3.1.0
* **Company KR Name:** Forecast accuracy within 10% for MRR for each quarterly outlook

Currently, we forecast MRR via Googlesheets. However, at the end of Q2 2023, we'll be using Anaplan to forecast Self-Service and Enterprise MRR/ARR.
{% enddocs %}