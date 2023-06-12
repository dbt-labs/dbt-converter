{% docs new_verified_accounts_activated %}

## Definition

Activated means that a (verified) dbt Cloud account that has 100+ dbt runs in its first 14 days. 
These runs must happen *inside of dbt Cloud*, either via CI/CD (i.e. the scheduler) or the IDE (or in the future: via the dbt CLI). 
The historical baseline for activation is around 5%. 

This specifically looks at only _verified_ Cloud Accounts. This means that there is at least one user that has verified their email. We use this filter to remove any spam Cloud Accounts.

Activation implies:
* An account has connected a data warehouse
* An account has connected a git repository
* An account has run dbt 100 times in its first 14 days (i.e. 14 days after their Cloud Account was created.)

## Calculations
**Sources:**
* **in dbt:** [fct_cloud_accounts](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_cloud_accounts)
* **in Looker:** [Cloud Accounts explore](https://fishtown.looker.com/explore/dbtLabs/cloud_accounts)

**Formulas:**
* **Verified Cloud Accounts:** Cloud Accounts that have at least one user that has a verified email.
* **Activation Due Date:** 14 days after they created their account
* Activated Cloud Accounts: Verified Cloud Accounts that connected their warehouse + Github repo _and_ reached 100+ invocations before or on their activation due date.
* **% of Activated Accounts:** `Total Activated Cloud Accounts / Total Verified Cloud Accounts`
## Resources
* [Link to Data Asset](https://fishtown.looker.com/looks/380)
* [Link to Googlesheet](https://docs.google.com/spreadsheets/d/1JJUNJGxv68ugT9VcTiTZthmBTNbXrnXygwHvputklNE/edit#gid=1594525499)
* [Link to OKR Doc](https://www.notion.so/dbtlabs/O1-Differentiate-dbt-Cloud-b64d52ac2d4d4422912ec5af33f618d5)

## Historical

### Fiscal Year 2023 Overview
* **Fiscal Year:** 2023
* **Company Objective:** O1. Differentiate dbt Cloud
* **Company KR #:** 1.2.0
* **Company KR Name:** Activate 20% of all new Cloud verified accounts by Q4:FY23

In this KR, we will seek to achieve a 20% 14-day activation rate for new Cloud accounts by the end of the fiscal year.

### Goals for Fiscal Year 2023
|Fiscal Quarter | Activation Rate (Goal) |
|:----------:|:----------------------:|
| Q1 (May 1) | 5%                     |
| Q2 (Aug 1) | 10%                    |
| Q3 (Nov 1) | 15%                    |
| Q4 (Feb 1) | 20%                    |

{% enddocs %}