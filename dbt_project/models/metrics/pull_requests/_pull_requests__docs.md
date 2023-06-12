{% docs dora_score %}
DORA scores are used by DevOps teams to measure performance over key metrics. See dbt docs for scoring. 

## Context
The [DevOps Research and Assessment (DORA) team at Google](https://www.devops-research.com/research.html) conducted six years of industry research aimed at identifying key metrics that indicate the performance of software development teams. For more details on the latest 2021 report and why we chose these parameters, please check out the [DevOps Research: 2021 Report](https://services.google.com/fh/files/misc/report_2021_accelerate_state_of_devops.pdf)

They identified four key metrics:
1. Deployment Frequency: How often does an organization successfully release to production?
2. Delivery Lead Time: How long do changes take from first commit to release?
3. Change Failure Rate: What percent of deployments result in a production failure?
4. Time to Restore Service: How long does it take an organization to recover from a production failure?

Along with identifying these metrics, the DORA team created a rubric that scores teams as Elite, High, Medium, or Low on each metric.

**Note:** For Deployment frequency, if it is the current month and it is incomplete, then we take the trailing X days of merged PRs.
For example, if it is February, then we take the trailing 28/9 days. If it is March, then we take the trailing 31 days, and so on.
## Definition
Per team, the goal is to score at least 13 out of 15 every month.
- Elite = 4pt
- High = 3pt
- Medium = 2pt
- Low = 1pt

Parameters for Scoring:
* Deployment Frequency: # of PRs created per week in a given month
    * Elite = On-demand (multiple deploys per day)
    * High = Between once per week and once per month
    * Medium = between once per month and once every 8 months
    * Low = Fewer than once per six months
* Delivery Lead Time:  Avg time it takes to deploy a code change per week in a given month
    * Elite = Less than one hour
    * High = Between one day to one week
    * Medium = Between one day and six months
    * Low = More than 6 months
* Merge Failure Rate: # of PRs that caused a bug (i.e. unwanted behavior)
    * Elite = 0-15%
    * Low = 16-30%
    * Note: If a team has more than 30% of the last 90 merged PRs as failures, then they will receive a 0. This should not be expected, but will be flagged in the Engineering:  DORA Metrics dashboard (linked below under Resources).
* Time to Restore Services: The avg time it takes for an incident to be resolved
    * Elite = Less than one hour
    * High = Less than one day
    * Medium = Between one day and one week
    * Low = More than six months

## Calculations

**Sources:**
* **in dbt:** [fct_github_pull_requests](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_github_pull_requests)
* **in Looker:** [Github Pull Requests](https://fishtown.looker.com/explore/dbtLabs/github_pull_requests)

**Formulas:**
* Deployment Frequency: `Count of Pull Requests / Total Weeks in the Month` (via the [fct_github_pull_requests](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_github_pull_requests) model)
* Delivery Lead Time: `Average Time to Merge per Week` (via the [fct_github_pull_requests](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_github_pull_requests) model)
* Deployment Failure Rate [TBD - currently the same as Merge Failure Rate]
* Merge Failure Rate: `Total PRs that Caused a Bug / Total PRs Merged -- all within a rolling 90 day period` (via the [fct_github_pull_requests](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_github_pull_requests) and [fct_jira_issues](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_jira_issues) (where the label = bug and connects to the PR that caused the bug) models)
* Time to Restore Services: `Avg Time to Resolution in a Given Month` (via the [stg_incidentio__incidents](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.stg_incidentio__incidents) model)

## Resources
* [Link to Measuring Engineer Teams doc](https://www.notion.so/dbtlabs/Measuring-Engineering-Teams-ffb8130e100e40f5910292f00c883abb)
* [Link to Data Asset](https://fishtown.looker.com/looks/338)
* [Link to DORA Dashboard](https://fishtown.looker.com/dashboards/333?Date%20Range=3%20month&Team=Core)
* [Link to Googlesheet]()
* [Link to OKR Doc](https://www.notion.so/O3-Improve-business-predictability-f27543a1cef5409b94c9bb8d7a71afa2)

## Historical

### Fiscal Year 2023 Overview
* **Fiscal Year:** 2023
* **Company Objective:** O3. Improve business predictability
* **Company KR #:** 3.2.0
* **Company KR Name:** 80% of R&D teams achieve a DORA score of 13 or higher every month in FY2023
{% enddocs %}
