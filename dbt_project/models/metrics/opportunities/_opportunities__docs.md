{% docs lost_pipeline_to_core %}

## Context
In calendar year 2021, 15% (18/119) of lost enterprise pipeline opportunities were lost to "Another version - dbt Core". These lost deals are indicative of an under-differentiated dbt Cloud experience. 

Going forward, we will make investments in the product that reduce the rate at which enterprise prospects view dbt Core as a fundamentally competitive offering with dbt Cloud. This will be evidenced by a smaller number of deals being lost to dbt Core (OSS). Note that for this KR, we will be monitoring lost pipeline opportunities specifically.

## Definition
We take the total pipeline opportunities that were lost due to dbt Core over the total number of pipeline opportunities that were open during a given quarter.

## Calculations
**Sources:**
* **in dbt:** [fct_opportunity_history](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_opportunity_history) model
* **in Looker:** [Salesforce Opportunities explore -> Opportunity History](https://fishtown.looker.com/explore/dbtLabs/salesforce_opportunities)

**Formulas:**
* **Pipeline Opportunities:** Opportunities that reached the `discover` stage (i.e. when `discover_at` is not null)
* **Lost Opportunities to Core:** `Total Pipeline Opportunities where Lost Sub-Reason = 'Core (Open Source)'`
* **Lost Opportunities to Core %:** `Total Lost Opportunities to Core / Total Pipeline Opportunities in a given period`

## Resources
* [Link to Data Asset](https://fishtown.looker.com/looks/380)
* [Link to Googlesheet](https://docs.google.com/spreadsheets/d/1JJUNJGxv68ugT9VcTiTZthmBTNbXrnXygwHvputklNE/edit#gid=1594525499)
* [Link to OKR Doc](https://www.notion.so/dbtlabs/O1-Differentiate-dbt-Cloud-b64d52ac2d4d4422912ec5af33f618d5)

# Historical

### Fiscal Year 2023 Overview
* **Fiscal Year:** 2023
* **Company Objective:** O1. Differentiate dbt Cloud
* **Company KR #:** 1.3.0
* **Company KR Name:** Less than 10% of lost pipeline opportunities are lost to self-hosted or vendor-hosted dbt Core by Q4:FY2023

### Goals for Fiscal Year 2023
| Fiscal Quarter | Pipeline Opportunities Lost to Core |
|:---------:|:-----------------------------------:|
| End of Q1 | 15%                                 |
| Q2        | 12.5%                               |
| Q3        | 10%                                 |
| Q4        | < 10%                               |

{% enddocs %}