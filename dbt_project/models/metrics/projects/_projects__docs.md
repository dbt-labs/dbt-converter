{% docs core_only_WAPs_using_Cloud %}

## Definition
* WAPs = Weekly Active Project. "Active" means a project ran an invocation (i.e. dbt run/build/test/etc in dbt Core and/or Cloud) within the past week/in the past 7 trailing days.

We calculate this metric by flagging projects who never ran a Cloud invocation prior to the current fiscal year.
And then, for a given week, how many projects in the above population were active that week (i.e. ran an invocation) and of those projects, how many of them had an invocation in dbt Cloud. We then divide those populations to get the conversion rate for that week (see example below).

## Calculations
**Sources:**
* **in dbt:** [fct_dbt_invocations](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_dbt_invocations)
* **in Looker:** [dbt Invocations explore](https://fishtown.looker.com/explore/dbtLabs/invocations)

**Formulas:**
* **Core-Only Projects**: Projects that existed before the current fiscal year and _never_ ran an invocation in Cloud before the current fiscal year
* **Core-Only WAPs**: Core-Only Projects that ran an invocation in a given week or in the past trailing 7 days
* **Core-Only WAPs using Cloud**: Core-Only Projects that ran an invocation _in dbt Cloud_ in a given week or in the past trailing 7 days
* **Core to Cloud Conversions**: `Core-Only WAPs using Cloud / Core-Only WAPs` in a given week or at the end of the quarter

## Resources
* [Link to Data Asset](https://fishtown.looker.com/looks/384)
* [Link to Googlesheet](https://docs.google.com/spreadsheets/d/12SKM54CQECjao0TVdNqB7Wcjr_4kz0htfcfiYp6_9Rg/edit#gid=286302974)
* [Link to OKR Doc](https://www.notion.so/dbtlabs/O1-Differentiate-dbt-Cloud-b64d52ac2d4d4422912ec5af33f618d5)

## Historical

### Fiscal Year 2023 Overview
* **Fiscal Year:** 2023
* **Company Objective:** O1. Differentiate dbt Cloud
* **Company KR #:** 1.1.2
* **Company KR Name:** 10% of existing connected warehouses using Core by Q4:FY2023

This Company-Level KR that cascades from KR1.1.0 (Reach 4,370 net-new Cloud WAPs). From a quantity perspective, we're aiming to see 570 Core-Only WAPs using Cloud at the end of the fiscal year. We define a "Core-Only WAP" as a project who _never_ ran an invocation in Cloud before FY2023 (i.e. before Feb 1 2022). Our aim is to ensure that, by the end of FY2023, we're seeing at least 10% of Core-only WAPs using Cloud.

| invocation_start_week | Core-Only WAPs that ran an invocation | Core-Only WAPs that ran an invocation in Cloud | % of Core-Only WAPs Using Cloud |
|-----------------------|---------------------------------------|------------------------------------------------|---------------------------------|
| 01-31-2022            | 4000                                  | 20                                             | .5%                             |
| 02-07-2022            | 4300                                  | 35                                             | .8%                             |
| 02-14-2022            | 4600                                  | 31                                             | .67%                            |
| 02-21-2022            | 4450                                  | 34                                             | .76%                            |

**Formula Variations:**
* **Core-Only Projects**: Projects that existed before FY2023 (2 Feb 2022) and _never_ ran an invocation in Cloud before FY2023

### Goals for the Fiscal Year 2023
| Fiscal Quarter | Fiscal WAP | Cumulative Total | Goal % |
|----------------|------------|------------------|--------|
| FY2023-Q1      |         57 |               57 |  1.00% |
| FY2023-Q2      |        114 |              171 |  2.00% |
| FY2023-Q3      |        171 |              342 |  3.00% |
| FY2023-Q4      |        228 |              570 |  4.00% |


{% enddocs %}

{% docs weekly_active_projects %}
The running total of dbt Projects with at least one invocation in the last trailing 7 days for any given day.
## Context
In the first 5 years of dbt’s existence, usage (measured by WAPs) tripled annually. In its sixth year, 2021, growth in usage has slowed down to 2.5x. We [project that WAP will grow even slower next year](https://app.hex.tech/fishtown/app/2fa79764-fb36-4d93-a97f-f4b043a99f75/latest) — around 1.5x — unless we take action to address this.
In the early days, dbt was riding the wave of the modern data stack. We experienced rapid growth alongside the rise of Snowflake. By the end of 2021, Snowflake had ~5000 customers and approximately 3,200 of them were dbt users. This is impressive market share that we intend to replicate in the other major warehouses, but it isn’t possible to triple again inside that same Snowflake customer base. 
This objective aligns product, partnerships, community, and marketing efforts around growing dbt adoption among a shortlist of warehouse providers.
## Definition
* WAPs = Weekly Active Project. "Active" means a project ran an invocation (i.e. dbt run/build/test/etc in dbt Core and/or Cloud) within the past week/in the past 7 trailing days.
## Calculations
There are two ways you can calculate WAPs:
**in dbt:**
* via [fct_dbt_invocations](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_dbt_invocations)
    * `Total Distinct Projects by Invocation Started Week`
* via [fct_dbt_project_activity](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_dbt_project_activity):
    * `sum(t7d_active) by Date Day`
* via [metrics](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.metrics)
    * metric_name = 'new WAPs'
    * `sum(metric_value) by Date Day/Week/Month` -- Note: this gives you the new dbt WAPs. To get an idea of the cumulative total, you'll want to do a `sum(metric_value) over (partition by metric_name order by date_day rows between unbounded preceding and current row)`. However, you cannot filter the dates.
    * This metric model is great for comparing the current metric value vs the daily goals we set for a given fiscal year. We suggest using the Metrics Dashboard (linked below) rather than writing the query.
**in Looker:**
* [dbt Invocations explore](https://fishtown.looker.com/explore/dbtLabs/invocations)
    * Started At Week || Count Distinct Projects
* [dbt Project Activity explore](https://fishtown.looker.com/explore/dbtLabs/dbt_project_activity)
    * Date Week || WAPs
* [Metric Dashboard](https://fishtown.looker.com/dashboards/86?Metric+Name=new+dbt+WAPs)
The first allows you to see all projects that ran an invocation in a given week while the latter allows you to see WAPs on a daily level because it looks at projects that ran an invocation in the past 7 days.
If you want to see weekly WAPs actuals vs. the daily goals, then we recommend using the metrics table. You can see what this looks like under the `Resources -> Data Assets` section below.
## Resources
* [Link to Data Asset - WAPs Overall](https://fishtown.looker.com/looks/382)
* [Link to Data Asset - WAPs by Adapter](https://fishtown.looker.com/looks/323)
* [Link to Googlesheet  WAPs Overall](https://docs.google.com/spreadsheets/d/1qjNMZaPltWCqKgkA6IzOnGD_4ehWBrs99YkklGahA6M/edit#gid=953924585)
* [Link to Googlesheet - WAPs by Adapter](https://docs.google.com/spreadsheets/d/1WmFMOzl4yaVI_VpF3TguVi1tYzwzu9YdN9lkQhXfXlU/edit#gid=2123183963)
* [Link to OKR Doc](https://www.notion.so/dbtlabs/O4-Increase-marketshare-within-total-addressable-market-be6f1ff7a37c43f499ba78fed6648b24)
## Historical
Before the usual holiday dip, we closed FY2022 at 8,158 WAP. In FY2022, we will aiming to grow WAP more than 2x — targeting 17,000 WAP. 
Based on our [best assumptions of existing market share and what we know about prior growth rates](https://docs.google.com/spreadsheets/d/1WRg5zQyAdivd1k9UxMNAHvHkGV6r7UEh5xVUCDcUO9s/edit#gid=0), we expect our top 5 growth areas to be: 
- 4,800 weekly active dbt projects on Snowflake
- 4,500 weekly active dbt projects on BigQuery
- 1,700 weekly active dbt projects on Redshift
- 1,200 weekly active dbt projects on Spark & Databricks combined
- 800 weekly active dbt projects on SQL Server & Azure SQL
### Fiscal Year 2023 Overview
* **Fiscal Year:** 2023
* **Company Objective:** O4. Increase total addressable market (TAM)
* **Company KR #:** 4.1.0
* **Company KR Name:** Grow Weekly Active Projects to 17,000 by the end of 2022.
{% enddocs %}
### Goals by Fiscal Quarter
WAPs (Overall)
|  Quarter  | New WAPs | Cumulative Total |
|:---------:|:--------:|------------------|
| Q4:FY2022 |          | 9,240            |
| Q1:FY2023 |   1,683  | 10,923           |
| Q2:FY2023 |   2,000  | 12,923           |
| Q3:FY2023 |   2,500  | 15,423           |
| Q4:FY2023 |   2,500  | 17,923           |
WAPS by Adapter
**Note:** We measure WAPs by Adapter at the end of every quarter
| Fiscal Quarter | Snowflake | BQ      | Redshift | Databricks & Spark | Azure & SQLServer |
|----------------|-----------|---------|----------|--------------------|-------------------|
| FY2023-Q1      |   3368.75 | 2783.25 |  1291.75 |             595.25 |            318.25 |
| FY2023-Q2      |   4412.50 | 3755.50 |  1694.50 |            1063.50 |            509.50 |
| FY2023-Q3      |   5456.25 | 4727.75 |  2097.25 |            1531.75 |            700.75 |
| FY2023-Q4      |   6500.00 | 5700.00 |  2500.00 |            2000.00 |            892.00 |
{% enddocs %}