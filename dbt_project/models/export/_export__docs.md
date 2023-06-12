{% docs export_cloud_accounts %}
This export model allows us to sync the accounts from our `fct_cloud_accounts` model to any external platform. This is an exact replica of `fct_cloud_accounts`. You can see all of the platforms this data is being synced to [in Hightouch](https://app.hightouch.io/dbtlabs/models/140064).
{% enddocs %}


{% docs export_cloud_user_account_mappings %}
This export model allows us to sync user account relationships from our `fct_cloud_user_account_mappings` model to any external platform. You can see all of the platforms this data is being synced to [in Hightouch](https://app.hightouch.io/dbtlabs/models/139915).
{% enddocs %}


{% docs export_cloud_users %}
This export model allows us to sync the users from our `fct_cloud_users` model to any external platform. This is an exact replica of `fct_cloud_users`. You can see all of the platforms this data is being synced to [in Hightouch](https://app.hightouch.io/dbtlabs/models/139994).
{% enddocs %}


{% docs export_inferred_user_id_mappings %}
This export model allows us to associate the anonymous tracking ID with the best
inferred `user_id` we have. We do this because Mixpanel events are not mutable.
What we do instead is that we associate the tracking IDs to the right user 
post-hoc via Mixpanel's 
[identity resolution process](https://developer.mixpanel.com/reference/create-identity) 
that makes use of an `$identify` event. So that the original anonymous tracking
ids could be properly associated to the identified account IDs.

This model takes the last `user_id` associated for each `domain_session_id`.
{% enddocs %}


{% docs export_slack_users %}
This export model allows us to sync our dbt Slack community members from our `dim_slack_users` model to any external platform. This is an exact replica of `dim_slack_users`. You can see all of the platforms this data is being synced to [in Hightouch](https://app.hightouch.io/dbtlabs/models/178022).
{% enddocs %}


{% docs export_pendo_visitors %}
This export model is designed to sync our dbt Cloud users' data to [Pendo](https://www.notion.so/dbtlabs/Pendo-828349718ee040c7bd4541bc8ba9ba01) – from overall user attributes to product permission & usage.
To find more information on this connection & data mapping setup, please use [Hightouch's Pendo Docs](https://hightouch.com/docs/destinations/pendo).
All of the existing syncs & run statuses can be found in our [Hightouch space](https://app.hightouch.io/dbtlabs/models).
{% enddocs %}

{% docs export_pendo_accounts %}
This export model is designed to sync our dbt Cloud projects' data to [Pendo](https://www.notion.so/dbtlabs/Pendo-828349718ee040c7bd4541bc8ba9ba01).
To find more information on this connection & data mapping setup, please use [Hightouch's Pendo Docs](https://hightouch.com/docs/destinations/pendo).
All of the existing syncs & run statuses can be found in our [Hightouch space](https://app.hightouch.io/dbtlabs/models).
{% enddocs %}

{% docs export_pendo_parent_accounts %}
This export model is designed to sync our dbt Cloud accounts' data to [Pendo](https://www.notion.so/dbtlabs/Pendo-828349718ee040c7bd4541bc8ba9ba01).
To find more information on this connection & data mapping setup, please use [Hightouch's Pendo Docs](https://hightouch.com/docs/destinations/pendo).
All of the existing syncs & run statuses can be found in our [Hightouch space](https://app.hightouch.io/dbtlabs/models).
{% enddocs %}


{% docs export_web_pageviews %}
This export model allows us to sync the page view events from our 
`fct_web_pageviews` model to any external platform. This is an exact replica of
`fct_web_pageviews`. You can see all of the platforms this data is being synced 
to [in Hightouch](https://app.hightouch.io/dbtlabs/models).
{% enddocs %}


{% docs export_web_conversions %}
This export model allows us to sync the conversion events from our 
`fct_web_conversions` model to any external platform. This is an exact replica of
`fct_web_conversions`. You can see all of the platforms this data is being synced 
to [in Hightouch](https://app.hightouch.io/dbtlabs/models).
{% enddocs %}


{% docs export_customer_references %}
This export model allows the product marketing team to maintain a list of all Salesforce Accounts that have agreed to be referenced as a customer. Accounts that are included in this model must have a value in the `customer_references` field in Snowflake. Several fields are formatted specifically for Notion database ingestion, specifically list fields (converted from text to array).

This database currently lives in [Notion](https://www.notion.so/dbtlabs/360081051e064d2c8de01fbccefa563e?v=e41999d74f8a496fa1e2b6e53b6e6514), and is updated via a [Hightouch Sync](https://app.hightouch.io/dbtlabs/syncs/35379).
{% enddocs %}


{% docs export_external_touchpoints %}
This export model is designed to sync external touchpoints to the Salesforce Touchpoints object. Currently, we are using this to sync dbt Slack sign ups and dbt Learn training enrollments as touchpoints in Salesforce. To add additional touchpoints, you simply need to reference the model that contains the touchpoints, format the data into the same format as existing touchpoints (seen in the `unioned` CTE) and then include it in the `unioned` expression.

**NOTE**  
We are mapping Touchpoints to Contacts in Salesforce based on email lookup. Therefore, we should only be syncing touchpoints where the email field is not null.

This model, as well as the corresponding syncs associated with this model, can be referenced in [Hightouch](https://app.hightouch.io/dbtlabs/models/576369).
{% enddocs %}

{% docs export_salesforce_contact_enrichment %}
This export model is designed to update Salesforce Contacts with key information received as a part of Coalesce registration. For now, these fields are limited to:
- Country Name
- Country Code
- Role
- Title

Of note: fields are only updated for Salesforce Contacts that don't currently have a value in the above fields. Therefore, if a registrant provides a different country name than what is already in Salesforce, then the field won't be updated.

This model is likely to expand in the future to include form fill information outside of Coalesce registration.
{% enddocs %}

{% docs export_attribution_touchpoints %}
This export model syncs Website Session, Conversion, and Salesforce Task data to the Salesforce touchpoints object. This is utilized for attribution modeling.
{% enddocs %}

{% docs export_opportunity_attribution %}
This export model syncs touchpoint-level credit to the attribution touchpoints object in Salesforce. This is utilized to analyze & develop reports in Salesforce at the opportunity level, understanding which teams, sources, and channels are resulting in pipeline creation.
{% enddocs %}