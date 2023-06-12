{% docs src_linkedin_pages %}
**Status:** Active

The LinkedIn Company Pages data source includes data from the [LinkedIn Company Pages API](https://docs.microsoft.com/en-us/linkedin/marketing/integrations/community-management/organizations). This includes page, follower, and share (post) statistics from LinkedIn. This will allow us to measure our organic social performance on LinkedIn. The majority of LinkedIn Company Pages models are built via the Fivetran `linkedin_pages` package [link to package in dbt Hub](https://hub.getdbt.com/fivetran/linkedin_pages/latest/).

Fivetran runs an extraction on this data source every 3hr. You can find the latest sync status on the [Fivetran connector status page](https://fivetran.com/dashboard/connectors/linkedin_company_pages/fivetran_linkedin_organic/status). To understand how these staging models connect with each other, check out [Fivetran's LinkedIn Company Pages ERD](https://docs.google.com/presentation/d/1PbexBiOTxplv7TlmNZ7uNo8EDT2Lr5g0Ys_ealh4qzI/edit?usp=sharing).

{% enddocs %}