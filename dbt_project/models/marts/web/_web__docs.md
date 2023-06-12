### Web Models

{% docs dim_web_page_tags %}
This model contains all dbt Labs' website pages and their associated content tags. Content tags are used to provide additional context about a web page, including the page type and content type.The acquisition marketing team uses a [Google Sheet](https://docs.google.com/spreadsheets/d/1FZObteyog6DTFQ7YYlowtrm632DvrWo6pv-5cWAPmcE/edit#gid=2676832) to manually tag each page.
{% enddocs %}

{% docs fct_web_conversions %}
This model features one row per website conversion. In addition, this model can be used to join to event, user, page, and website session data to better understand the events leading up to a conversion, or a user's conversions over time.

For more information on how we are tracking website conversions, please visit the [Tracking & Measuring Website Conversions](https://www.notion.so/dbtlabs/Tracking-Measuring-Website-Conversions-8a8af5bbf2234d1abcfacb05a0c74c07) Notion doc.
{% enddocs %}

{% docs snowplow_id_mappings %}

This model maps a `domain_userid` (a cookie or device) to the most recent `cloud_user_id` or `email` from a form submit. This mapping is the core of "identity stitching", the process whereby events fired prior to user authentication get associated with the authenticated `cloud_user_id` during the modeling process.

It is important to note that this mapping and the ensuing user stitching make the assumption that there will only ever be a single valid user authenticating within a single `domain_userid` (cookie or device). This is typically a good assumption to make, but if your use case relies on multiple users logging in on a shared workstation (or similar) you may want to build your own custom identity stitching logic.

The hierarchy for mapping a `domain_userid` to a `cloud_user_id` is as follows:
- If the user logs into dbt Cloud in a web session, the User ID from that session persists.
- If the user doesn't log into dbt Cloud, but submits a form, then the email address provided in the form is mapped to a Cloud User ID, and that User ID persists.
- If the user doesn't log into dbt Cloud, and submits a form, but the email on that form does not map to a Cloud User ID, then this field will be null. That being said, there is a chance the email can be mapped to a Salesforce Contact record, and therefore Salesforce Contact ID will be accessible.

![Snowplow ID Map](https://lucid.app/publicSegments/view/401481ae-88e2-411d-9d8e-40747c600bc8/image.png "View Snowplow ID Map in LucidChart")

{% enddocs %}

{% docs fct_web_attribution_sessions %}
This model features all website sessions leading up to each conversion on our website and the associated attribution points for each sessions. Since sessions can attributed to several different conversions, the grain of this table is one row per session per conversion. The different attribution models that can be accessed from this model include first touch, last touch, linear, and forty-twenty-forty. This model is especially useful for analyzing which marketing mediums, sources, and campaigns are contributing to website conversions.
{% enddocs %}

{% docs fct_web_attribution %}
This model re-shapes the `fct_web_attribution_sessions` model to be user-friendly in our BI tools. For the end user, this means there is a single field, `attribution_model`, that can be filtered on to make attribution analysis seamless. In addition, Cloud accounts are joined into this model to enrich Cloud signup conversions with account-level information. Note: Cloud account information is only joined into this model if it's a user's first Cloud signup conversion and they are a creator on that account.
{% enddocs %}

### Website Conversion Fields

{% docs inferred_user_id %}
A unique identifier that enables cross-device & multiple-cookie web tracking.
This is based on the logic built in the `snowplow_id_mappings`.
This field is used to map sessions across differing `user_snowplow_domain_id` values to a single individual.
{% enddocs %}

{% docs page_view_id %} The unique ID associated with each website page view. This can be used to understand which exact page_view event a conversion happened on. {% enddocs %}

{% docs session_id %} The unique ID associated with each website session. This can be used to understand which other events happend during a converting session. {% enddocs %}

{% docs event_id %} The unique ID of the event that fired a conversion. This maps to a Snowplow event.{% enddocs %}

{% docs conversion_id %} The identifier used to determine which conversion event fired. {% enddocs %}

{% docs conversion_name %} The name of the conversion. This follows the nomenclature of `action_asset-name` {% enddocs %}

{% docs conversion_type %} The event type that triggered the conversion. {% enddocs %}

{% docs conversion_group %}
The group under the conversion falls under.
This is parsed from first part of the conversion_name, delimited using `_`.
For example, the `register_cloud` conversion will have the conversion group of `register`.
{% enddocs %}

{% docs converted_at %} A timestamp indicating when the conversion occured. {% enddocs %}

{% docs conversion_index %} The Nth conversion for a particular user. {% enddocs %}

{% docs conversion_name_index %}
The Nth conversion for a particular `conversion_name`.
For example, a user's first `register_coalesce` conversion will be `1`, and their second `register_coalesce` conversion will be `2`. This is most useful for parsing a user's first `register_cloud` conversion, which is synonymous with their signup event.
{% enddocs %}

{% docs conversion_group_index %}
The Nth conversion for a particular `conversion_group`.
For example, if a user has a `download_business-case-guide` conversion on 2022-01-01, this value will be `1`.
If that same user has a `download_analytics-engineering-guide` conversion on 2022-02-01, this value will be `2`.
{% enddocs %}

### Marketing nomenclature fields (parsed from UTM parameters)

{% docs marketing_campaign_period %}
The period in which a marketing campaign was run.
This is parsed from the first portion from our campaign nomencalture:
`campaign-period_campaign-name_campaign-goal`
{% enddocs %}

{% docs marketing_campaign_name %}
The formal name of the marketing campaign.
This is parsed from the section portion from our campaign nomenclature:
`campaign-period_campaign-name_campaign-goal`
{% enddocs %}

{% docs marketing_campaign_goal %}
The goal of the marketing campaign. This can be one of three values: `awareness`, `conversion`, `retention`.
This is parsed from the third portion of our campaign nomenclature:
`campaign-period_campaign-name_campaign-goal`
{% enddocs %}

{% docs marketing_offer %}
The offer we are providing for a given marketing asset.
This can be one of six values: `teach`, `connect`, `advise`, `gifts`, `apps/tools`, `product`.
This is parsed from the first portion of our content nomenclature:
`offer-type_asset-name_asset-version`
{% enddocs %}

{% docs marketing_asset %}
The marketing creative and/or asset.
This is parsed from the second portion of our content nomenclature:
`offer-type_asset-name_asset-version`
{% enddocs %}

{% docs marketing_asset_version %}
The version of the marketing asset. This is useful for A/B testing.
This is parsed from the third portion of our content nomenclature:
`offer-type_asset-name_asset-version`
{% enddocs %}

{% docs channel %}
The marketing channel (Paid Search, Social, etc) mapping dictated by a session's source / medium combination.
{% enddocs %}

{% docs sub_channel %}
The platform (Google Ads, LinkedIn Ads, etc) within a given channel (Paid Search, etc), mapping dictated by a session's source / medium combination.
{% enddocs %}

{% docs source_mapping_id %}
A surrogate key built off of source & medium to map to a channel and sub_channel.
{% enddocs %}

{% docs ad_web_mapping_id %}
A surrogate key built off of `marketing_campaign`, `sub_channel` and `session_start_date`.
This is used to join into `fct_ad_reporting_daily` to get spend by campaign & platform by day.
{% enddocs %}

### Marketing attribution model docs

{% docs attributed_conversion_id %}
A surrogate key created from the `attribution_session_id` and `attribution_model` for each conversion. This ensures we have 1 row per session per conversion per attribution model.
{% enddocs %}

{% docs attributed_session_id %}
A surrogate key created from the `session_id` and `event_conversion_id` fields. This ensures we have 1 row per session per conversion in our attribution models.
{% enddocs %}

{% docs attribution_model %}
The type of `attribution_model` used to analyze credit distribution. This is designed to be a filter field enabling easy analysis of any of the 4 current attribution models. Those attribution models include: first touch, last touch, linear, and forty-twenty-forty.
{% enddocs %}

{% docs forty_twenty_forty_points %}
Attribute 40% (0.4 points) of the attribution to the first touch, 40% to the last touch, and divide the remaining 20% between all touches in between
{% enddocs %}

{% docs first_touch_points %}
Attribute the entire conversion to the first touch
{% enddocs %}

{% docs last_touch_points %}
Attribute the entire conversion to the last touch
{% enddocs %}

{% docs linear_points %}
Divide the point equally among all touches
{% enddocs %}

{% docs experiment_name %}
The name of the experiment that the page view and/or session is a part of. This is used for A/B testing.
{% enddocs %}

{% docs branch_name %}
The name of the GitHub branch the controls the website content being shown. This is used to provide variants in a website experiment. This is synonymous with variant name, with 'main' being the control.
{% enddocs %}

{% docs total_sessions_in_conversion_window %}
The total number of sessions leading up to a specific conversion.
This is useful if you are interested in seeing how many website sessions it took for a user to convert, or if you are analyzing the average number of sessions it takes to result in a conversion.
{% enddocs %}

{% docs conversion_session_index %}
The Nth session for a specific conversion.
For example, a user's first website session leading up to a conversion will have the value `1`.
This is useful if you want to view the sessions leading up to a conversion in a sequence - similar to sorting by `session_start`.
{% enddocs %}

{% docs is_converting_session %}
A boolean field that indicates if there was a conversion during a particular session.
{% enddocs %}

{% docs is_first_conversion %}
A boolean field indicating if a conversion was the user's first ever conversion.
{% enddocs %}

{% docs is_first_conversion_of_name %}
A boolean field indicating if a conversion was the user's first ever conversion for that specific conversion name.
For example, if a user registers for Coalesce for the first time on 2021-01-01, the value will be `TRUE`.
If that same user registers for Coalesce again on 2022-01-01, the value will be `FALSE`.
{% enddocs %}

{% docs is_first_conversion_of_group %}
A boolean field indicating if a conversion was the user's first ever conversion for that specific conversion group.
For example, if a user downloads a piece of content for the first time on 2021-01-01, the value will be `TRUE`.
If the same user downloads another piece of content on 2022-01-01, the value will be `FALSE`.
{% enddocs %}

{% docs days_from_session_to_conversion %}
The number of days between a user's session and the conversion it is associated with.
{% enddocs %}


### Web Session Fields

{% docs is_internal_user %}
A boolean flag that indicates if the Snowplow user is a part of the dbt Labs organization. This is useful for filtering out internal traffic in analyses.
{% enddocs %}