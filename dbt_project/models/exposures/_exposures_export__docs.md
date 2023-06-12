{% docs dbt_cloud_salesforce_export %}
**Status**: Active

We are using Hightouch to sync a record of our dbt Cloud users, accounts, and user account relationships to Salesforce. This ensures we have the most up-to-date values possible in Salesforce. These records are synced to the below objects in Salesforce:
- `export_cloud_accounts` -> dbt Cloud Account` [Link to cloud_accounts -> Salesforce sync](https://app.hightouch.io/dbtlabs/syncs/29575) | [Link to dbt Cloud Account object in Salesforce](https://fishtown.lightning.force.com/lightning/setup/ObjectManager/01I6g000002uPjU/FieldsAndRelationships/view)
- `export_cloud_user_account_mappings` -> `dbt Cloud Account User` [Link to cloud_user_account_mappings -> Salesforce sync](https://app.hightouch.io/dbtlabs/syncs/29571) | [Link to dbt Cloud User Account object in Salesforce](https://fishtown.lightning.force.com/lightning/setup/ObjectManager/01I4v000002W7VN/FieldsAndRelationships/view)
- `export_cloud_users` -> `dbt Cloud User` [Link to cloud_users -> Salesforce sync](https://app.hightouch.io/dbtlabs/syncs/29576) | [Link to dbt Cloud User object in Salesforce](https://fishtown.lightning.force.com/lightning/setup/ObjectManager/01I4v000002W7VO/FieldsAndRelationships/view)
{% enddocs %}


{% docs hubspot_export %}
**Status**: Active

We are using Hightouch to sync our dbt Cloud users & dbt Slack community members to HubSpot. By doing so, we are able to segment our marketing lists with the information provided by these data sources. Both of these sources are enriching the Contact object in HubSpot.

You can find [all active HubSpot syncs here](https://app.hightouch.io/dbtlabs/syncs?search=hubspot).
{% enddocs %}


{% docs mixpanel_export %}
**Status**: Active

We are using Hightouch to sync our dbt Cloud users and their relevant events to 
Mixpanel. By doing so, we are able to use Mixpanel as our product analytics
platform. You can learn more about this implementation in the 
[Mixpanel Overview Notion Page](https://www.notion.so/dbtlabs/Mixpanel-Overview-6e85767f11c146d0a14a45c62b0fdcac)

You can find [all active Mixpanel syncs here](https://app.hightouch.io/dbtlabs/syncs?search=mixpanel+prod).
{% enddocs %}


{% docs single_tenant_fivetran_alerts %}
**Status**: Active

This Hightouch sync sends an alert to the data team when a new single tenant connection is created in Fivetran. The team is using this to ensure our data models are updated with single tenant clients as early as possible.

Details on this sync can be found here [Fivetran <> Slack Alert](https://app.hightouch.io/dbtlabs/syncs/29036)
{% enddocs %}

{% docs customer_references_notion_database %}
**Status**: Active

The [Customer References Notion database](https://www.notion.so/dbtlabs/360081051e064d2c8de01fbccefa563e?v=e41999d74f8a496fa1e2b6e53b6e6514) features all Salesforce Accounts that have agreed to be referenced as a customer. This database is being updated via a Hightouch sync that runs every 3 hours.

Details on this sync can be found here [Hightouch -> Notion Sync](https://app.hightouch.io/dbtlabs/syncs/35984)
{% enddocs %}

{% docs external_touchpoints_to_salesforce_touchpoints %}
**Status**: Active

We are using Hightouch to sync certain touchpoints to the Salesforce Touchpoints object. This model is used exclusively for touchpoints that aren't natively accounted for in Salesforce. Currently, this includes two touchpoint sources, including:
- dbt Slack community sign ups
- dbt Learn training enrollments

The Hightouch sync to Salesforce can be found here: [External Touchpoints to Salesforce](https://app.hightouch.io/dbtlabs/syncs/41786)
{% enddocs %}