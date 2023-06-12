{% docs fct_touchpoints %}

This model features one row per touchpoint in Salesforce. A touchpoint is defined as an interaction between a prospective customer and our business. Examples include (but are not limited to): contacting sales, signing up for dbt Cloud, downloading content, or signing up for a newsletter.

Touchpoints are a key mechanism in determining if a Contact is qualified to be reached out to by the Sales team. For more information on how we're tracking touchpoints, a full list of active touchpoints, and the contact qualification process check out the [Leads -> Touchpoints project document](https://www.notion.so/dbtlabs/Leads-Touchpoints-Transition-94645a6d3985479698f3fa9b0e5948a0).

**NOTE**
Qualified touchpoints were introduced in May 2022. Any touchpoint before this time is automatically considered qualified, since that reflected our old process. As a result, you will notice a dip in qualified touchpoints starting in May 2022 as a result of a process change.
{% enddocs %}

{% docs fct_salesforce_goals %}
The Salesforce Goals dataset is used by the Marketing and Revenue teams to better understand how Leads, Opportunities, and Cloud Accounts are pacing toward our goals. Goals are created in Salesforce via the [Goal object](https://fishtown.lightning.force.com/lightning/setup/ObjectManager/01I4v000002W7va/Details/view). These values are typically updated every 6 months by the GTM Operations team - though, there are instances where goals are amended quarterly.

**Note:** Lead, pre-pipeline, pipeline, and cloud account goals are segmented by the following fields
----------------------------------

Lead & pipeline goals are segmented by:

- date
- goal_type (leads & pipeline)
- market segment
- team
- region
- touchpoint_source
 
pre-pipeline goals are segmented by:
- date
- goal_type (pre-pipeline)
- market segment
- team
- region
 
cloud account goals are segmented by:
- date
- goal_type (cloud accounts)
- market segment
- region
- channel

----------------------------------
Because goal amounts are broken down daily, they can be summed up to the week, month, quarter, and yearly level.

**IMPORTANT**
If you create a new `team`, `region`, or `market_segment` value in Salesforce, then the accepted values test in `stg_salesforce__goals` needs to be updated accordingly. More information can be found in the [How to Update Salesforce Goals Notion document](https://www.notion.so/How-to-Update-Salesforce-Goals-b7d7af3f7366493e8241c75c7076dc79).

{% enddocs %}

{% docs fct_opportunity_attribution %}

This model features one row per touchpoint for a Land opportunity. It is used to attribute the value of each touchpoint for a given opportunity. At the single opportunity level, this model be used to better understand which actions led up to that opportunity being created. In aggregate, this model can be used to uncover trends in pipeline generation, including which channels, sources, and actions are most likely to drive pipeline creation.

For more information on how we calculation pipeline attribution, please visit the [Multi-Touch Attribution](https://www.notion.so/dbtlabs/Multi-Touch-Attribution-50d5303648d544b9be56601ea12647c7) document in Notion. For information on how we modeled this data, please [watch this Loom video](https://www.loom.com/share/dfa1390e52544d079df32d29ce724b51).

**NOTE**
This model **is not yet** utilized for formal pipeline credit distribution. We anticipate making many changes to the scoring methodology used in this model before we reach that point. That being said, this model **will** be used to analyze campaign, channel, and offer performance, establish team KPIs, and to provide more accurate reporting in our Campaign 360 dashboard.
{% enddocs %}

{% docs sfdc_account_id %}
The Salesforce Account ID
{% enddocs %}

{% docs persona %}
Contacts are classified into their respective persona based on their job title.
There are currently 5 personas that we are tracking: Knowledge Builder, Knowledge Analyzer, Manager/Lead/Mentor, Periphery Influencer, and Executive Influencer.
More info on the dbt Personas can be found [here](https://docs.google.com/spreadsheets/d/1w_YE3VrGDzdmBQ8Xim4AtT9GjMMGvZ0PprFL0sToPCo/edit?usp=sharing).
{% enddocs %}

{% docs account_segmentation %}
Accounts are classified into their respective segment based on their number of employees and year the company was founded. 
There are currently 4 segments derived from this categorization, which is used as part of dbt Labs' ideal customer segmentation (ICP) work and sales playbooks. 
----------------------------------

The 4 segments are: 
- Small Legacy: companies founded before 2001 with less than 1,000 current employees 
- Large Legacy: companies founded before 2001 with 1,000 or more current employees
- Small Digital Native: companies founded in 2001 and after with less than 1,000 current employees
- Large Digital Native: companies founded in 2001 and after with 1,000 or more current employees

----------------------------------
More information on these segments and opportunity performance can be found in Notion [here](https://www.notion.so/dbtlabs/dbt-ICP-What-drives-our-most-successful-accounts-a6b97864de9044dc9e83b360c5354f22?pvs=4#af24f8cbab4840928694494eef33f172). 
{% enddocs %}