{% docs gross_dollar_renewal_rate %}
Dollars renewed / dollars up for renewal in a given period (annualizing the dollar amounts).
This allows us to account for customers of different sizes.

## Context
Renewal metrics are tricky, but the clearest frame for assessing the rate of renewal is simply given the choice to continue using our service or not, at what rate do customers continue using it?

## Calculations
**Sources:**
* **in dbt:** [fct_subscription_transactions](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_subscription_transactions) model
    * category = dbt_cloud
* **in Looker:** [Subscriptions explore](https://fishtown.looker.com/explore/dbtLabs/subscription_transactions)
    * category = dbt_cloud

**Formulas:**
* Dollars Lost: `(Total Churned MRR + Total Downgrade MRR)`
* Dollars up for Renewal: `Sum of Prior MRR`
* Renewal Rate: `(Dollars Lost / Dollars Up for Renewal) + 1`

## Resources
* [Link to Data Asset](https://fishtown.looker.com/looks/357)
* [Link to Googlesheet](https://docs.google.com/spreadsheets/d/15-b8S2NYct7_0koI371loUE5dg3WNl9khgDVPZaun44/edit#gid=1208561251)
* [Link to OKR Doc](https://www.notion.so/dbtlabs/O2-Retain-and-grow-customers-145f49e54a0a4f0e806e568ed0551e30)

## Historical

### Fiscal Year 2023 Overview
* **Fiscal Year:** 2023
* **Company Objective:** O2. Retain and Grow Customers
* **Company KR #:** 2.1.0
* **Company KR Name:** Achieve a 97% Gross Dollar Renewal Rate

As of end of FY2022, we renew between [96% and 98% (97% average)](https://fishtown.looker.com/looks/328?toggle=dat,pik,vis) of self-service MRR each month.  In FY2022 we [lost $36k of $1.5m dollars](https://docs.google.com/spreadsheets/d/16c98duskuhIVALLn-CwVv1cRA-Ee5mbOqJZa1agVyRI/edit#gid=1038280074) (98% renewal rate).  These are fantastic stats, that don’t need to be improved, but will require a great deal of work to maintain as the customer base grows.  Our goal for this year is simply to hold at these rates.
{% enddocs %}

{% docs dollar_expansion_rate %}
Total upgrade revenue / the total revenue for a given period. 
We want to look at ARR in the beginning of the quarter and then sum the expansion over the course of the quarter. Please see example below.

## Context
Expansion can happen at any time and is best measured as a percent of the customer base at the start of a period.  Expansion tends to happen in quarterly “lumps” on the managed side of the business and is a smooth monthly curve on the self-service side of the house.  Since it is easier to aggregate up we chose quarters as the period.  Quarters are also a decent period to measure expansion because they do a good job forcing “compounding” growth (vs a year or 6 months) from new ARR added to the customer base.

## Calculations
**Sources:**
* **in dbt:** [fct_subscription_transactions](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.fct_subscription_transactions) model
    * category = dbt_cloud
* **in Looker:** [Subscriptions explore](https://fishtown.looker.com/explore/dbtLabs/subscription_transactions)
    * category = dbt_cloud

**Formulas:**
* Starting ARR (self-service): `Total MRR * 12` - at the beginning of the quarter
* Starting ARR (managed): `Total ARR`
* Expansion ARR (self-service): `Total Upgraded MRR * 12`
* Expansion ARR (managed): `Total Upgraded ARR`
* Expansion Rate: `Total Expansion ARR / Total Starting ARR`
## Resources
* [Link to Data Asset](https://fishtown.looker.com/looks/364)
* [Link to Googlesheet](https://docs.google.com/spreadsheets/d/1AXzSE-9B6A-p_SP1k3oDrplh2U8Bh28GZ4MqNs_V59E/edit#gid=1457972319)
* [Link to OKR Doc](https://www.notion.so/dbtlabs/O2-Retain-and-grow-customers-145f49e54a0a4f0e806e568ed0551e30)

## Historical

### Fiscal Year 2023 Overview
* **Fiscal Year:** 2023
* **Company Objective:** O2. Retain and Grow Customers
* **Company KR #:** 2.2.0
* **Company KR Name:** Average 11% QoQ (52% Annualized) Dollar Expansion Rate

| Quarter (Fiscal) | Self Service Starting ARR | Self Service Expansion | Managed ARR | Managed Expansion | Joined Starting | Joined Expansion | Joined Expansion Rate |
|:----------------:|:-------------------------:|:----------------------:|:-----------:|:-----------------:|:---------------:|:----------------:|:---------------------:|
| 2022-Q1          | $1.26m                    | $210.7k                | $1.50m      | $261.1k           | $2.76m          | $471.8k          | 17%                   |
| 2022-Q2          | $1.72m                    | $319.0k                | $2.43m      | $1.38m            | $4.15m          | $1.70m           | 41% (USAA)            |
| 2022-Q3          | $2.33m                    | $432.9k                | $5.05m      | $231.8k           | $7.38m          | $664.6k          | 09%                   |
| 2022-Q4          | $3.06m                    | $516.0k                | $7.41m      | $569.6k           | $10.47m         | $1.09m           | 10%                   |
{% enddocs %}


{% docs mutual_action_plan %}
A field in Salesforce that will indicate the status of a managed account's progress on their action plan. If their mutual action plan's status is "good" then it is counted as being "On-Track"

## Context
Account plans are shared documents between the customer and the account team that detail:

1. A customer’s business objectives for a given contract period
2. An implementation plan for achieving those objectives with milestones
3. A cadence for communication between the customer and the account team

## Calculation
**Sources:**
* **in dbt:** [dim_salesforce_accounts](https://cloud.getdbt.com/accounts/1/jobs/940/docs/#!/model/model.fishtown_internal_analytics.dim_salesforce_accounts) model
* **in Looker:** [Salesforce Opportunities (contains Salesforce Accounts) explore](https://fishtown.looker.com/explore/dbtLabs/salesforce_opportunities)

**Formulas:**
* On-Track Accounts: `Total Managed Accounts where the action plan's status is 'good'`
* % of On-Track Accounts: `Total On-Track Accounts / Total Active Managed Accounts` in a given period
## Resources
* [Link to Data Asset](https://fishtown.looker.com/looks/394)
* [Link to Googlesheet](https://docs.google.com/spreadsheets/d/1ZpnsKTlrkqBD25LunXKWgMWBj5vo0JDnBznm-CuIKoA/edit#gid=654787094)
* [Link to OKR Doc](https://www.notion.so/dbtlabs/O2-Retain-and-grow-customers-145f49e54a0a4f0e806e568ed0551e30)

## Historical

### Fiscal Year 2023 Overview
* **Fiscal Year:** 2023
* **Company Objective:** O2. Retain and Grow Customers
* **Company KR #:** 2.3.0
* **Company KR Name:** Average 11% QoQ (52% Annualized) Dollar Expansion Rate
{% enddocs %}

{% docs customers_counts_managed %}

This metric is intended to be reported at the fiscal-quarter-grain or higher, 
therefore, dimension values replace native time grains in this metric definition.

{% enddocs %}
