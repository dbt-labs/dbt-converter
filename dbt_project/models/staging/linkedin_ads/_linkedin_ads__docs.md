{% docs linkedin_ads_status %}
- ACTIVE - Creative creation is complete and creative is available for review and serve.
- PAUSED - Creative creation is complete and creative is current, but should temporarily not be served. This status is not valid upon creation.
- DRAFT - Creative creation is incomplete and may still be edited.
- ARCHIVED - Creative creation is complete, but creative should not be served and should be separated from non-archived creatives in any UI.
- CANCELED - Creative is permanently canceled.
{% enddocs %}

{% docs linkedin_ads_click_uri %}
Required when creative type is TEXT_AD. Maximum character limit of 500 after URL encoding all special characters. 
Limit does not include the "https://" prefix.
For sponsored update ads, this is populated via the `share_history` table from LinkedIn Organic data.
{% enddocs %}
