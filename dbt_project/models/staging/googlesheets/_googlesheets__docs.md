{% docs src_googlesheets %}
**Status:** Active

We pull in Googlesheets via Fivetran if we want to track a source that does not have a connector/an open API and maintaining the spreadsheet isn't too difficult (e.g. adding private dbt Learn attendees). We may also bring in a googlesheet if we want to bring in a small historical data set (e.g. dbt project registrations from partners) or form submissions.

The tables that we bring in via these googlesheets directly reflect the googlesheet's columns and we refresh these tables in Fivetran every 6 hours.
{% enddocs %}


{% docs googlesheets_dbt_project_reg %}
**Status:** Inactive

Historically, the Alliances team used a Google form for when partners registered a dbt project. This process is now automated where we use a Hubspot form that directly creates the lead in Salesforce. Because this is a historical googlesheet, we no longer actively use this Googlesheet integration. 

To view the spreadsheet, you can [click here](https://docs.google.com/spreadsheets/d/1a2N7fmZTE_a233waW4AjilySw2eDwrRjnbreWwwa2WQ/edit).
{% enddocs %}

{% docs googlesheets_incidentio_incidents %}

**Status:** Active

This spreadsheet contains all incidents from Incident.io. This is currently a manual pull process from Connor .

To view the spreadsheet, you can [click here](https://docs.google.com/spreadsheets/d/1G4jyIrM4-WH86IMIb31IDLnatRXEdsu7papsCSFXjYo/edit#gid=1679884423).

{% enddocs %}


{% docs googlesheets__rate_ro %}
**Status:** Active

## This spreadsheet contains Rate My Rapid Onboarding information.


## The AEs will fill out this exit survey on the last day of rapid onboarding

### Three parts:
- General client questionnaire which covers engagement, participation, etc.
- Exit Survey Criteria and whether they completed the tasks expected of them
- Short Answer Section with question prompts for Red Flags, Potential conversation topics, etc.

### The immediate goal of this give SAs and SDs a picture of how a customer worked during the six week period
- if there were any dbt champions discovered
- if there are any nuances in implementation they should know about
- if they achieved all the exit criteria, if there are any red flags or opportunities.

The long term benefits include identifying areas that all customers (or customer in certain regions) have trouble with and making improvements to the curriculum to address those learnings

To view the poll, you can [click here](https://docs.google.com/forms/d/e/1FAIpQLSf9SRK2iVOT85dX2Q4wPkiH0FrF2-eEVM73IzaK8pD94XMGww/viewform).
To view the spreadsheet, you can [click here](https://docs.google.com/spreadsheets/d/1ubFWDRPTrktNP5_emR-JP5K2t7TV8l8GPLTwn2p9FFM/edit#gid=0).
{% enddocs %}

{% docs googlesheets_rev_allocation_overrides %}
This model allows the revenue accounting team to ignore a calculated revenue reallocation (see fct_revenue_allocations). [Source](https://docs.google.com/spreadsheets/d/1pdr9ZOIht1GJbw6ppAupmwG0CE6i04BIH632H0rMvug/edit#gid=497549964)
{% enddocs %}

{% docs googlesheets_rev_invoice_overrides %}
This model allows order item invoices to be overridden by the accounting team. Note that we have not defined
a primary key in this model as we add one downstream using the salesforce unique id. [Source](https://docs.google.com/spreadsheets/d/1pdr9ZOIht1GJbw6ppAupmwG0CE6i04BIH632H0rMvug/edit?usp=sharing)
{% enddocs %}

{% docs googlesheets_rev_rpo_overrides %}
This model allows order item RPO amounts to be overridden by the accounting team. Note that we have not defined
a primary key in this model as we add one downstream using the salesforce unique id. [Source](https://docs.google.com/spreadsheets/d/1pdr9ZOIht1GJbw6ppAupmwG0CE6i04BIH632H0rMvug/edit#gid=8716450)
{% enddocs %}

{% docs googlesheets_rev_schedule_overrides %}
This model allows order item revenue schedules to be overridden by the accounting team. [Source](https://docs.google.com/spreadsheets/d/1pdr9ZOIht1GJbw6ppAupmwG0CE6i04BIH632H0rMvug/edit#gid=0)
{% enddocs %}

{% docs googlesheets_rev_transaction_overrides %}
This model allows order item revenue transaction to be overridden by the accounting team. [Source](https://docs.google.com/spreadsheets/d/1pdr9ZOIht1GJbw6ppAupmwG0CE6i04BIH632H0rMvug/edit#gid=476313840)
{% enddocs %}

{% docs googlesheets_self_service_transaction_line_overrides %}
This model allows self-service transaction lines to be overridden by the accounting team. This allows for 100% recognition rather
than the baseline per-day approach. 
[Source](https://docs.google.com/spreadsheets/d/1pdr9ZOIht1GJbw6ppAupmwG0CE6i04BIH632H0rMvug/edit#gid=476313840)
{% enddocs %}

{% docs googlesheets_private_learn_enrollments %}
**Status:** Active

This spreadsheet contains all private dbt Learn attendees and is maintained by the Training team.

To view the spreadsheet, you can [click here](https://docs.google.com/spreadsheets/d/1eR-wY_mYcmxMLLc785kW9RuoR9by4H5QIo-lumQ7eyo/edit#gid=1062293443).
{% enddocs %}

{% docs googlesheets_global_training_nps %}
**Status:** Inactive

This spreadsheet contains all NPS scores from dbt Learn, Rapid Onboarding &
Group Training. This sheet is inactive as the training team has moved to a Typeform survey

To view the spreadsheet, you can [click here](https://docs.google.com/spreadsheets/d/1tGTHXToEIRLlVr9-RWeNUhdfPMCGFya9G6tea60g4PA/edit#gid=2043790232).

{% enddocs %}

{% docs googlesheets_global_training_feedback %}
**Status:** Active

This spreadsheet contains all NPS scores from dbt Learn, Rapid Onboarding &
Group Training from the Typeform Survey.

To view the spreadsheet, you can [click here](https://docs.google.com/spreadsheets/d/1mhfE7cacE1Tsn9Z9xJxmHvyjn1Iiuz9PLubwQQfr0ZA/edit#gid=1727417117).

{% enddocs %}

{% docs googlesheets_website_content_tags %}
**Status:** Active

This spreadsheet contains all of the pages on our website properties and their associated content tags. Members of the acquisition marketing team are using this sheet to manually tag the following properties:
* page_type
* content_pillar
* status
* target_keyword
* target_position
* target_monthly_traffic

To view this spreadsheet, you can [click here](https://docs.google.com/spreadsheets/d/1FZObteyog6DTFQ7YYlowtrm632DvrWo6pv-5cWAPmcE/edit#gid=2676832)

Below is a visual example of the operational flow to get this data from Google Sheets into our dimensional models
<iframe style="border:none" width="800" height="450" src="https://whimsical.com/embed/4iKryTBNdEZoA7cWrW81Zc"></iframe>
{% enddocs %}

{% docs googlesheets_proserv_staff_engagement %}
**Status:** Active

This spreadsheet contains answers to the CSAT survey completed by Pro-Serv members once an engagement ends.

To view the spreadsheet, you can [click here](https://docs.google.com/spreadsheets/d/1vm_H8zRsSm8QqTweK-hzehhuorTTZNJ_gKnOM1XHdNc/edit#gid=949824636).

{% enddocs %}

{% docs page_type %}

This field is used to group pages by their broader types. This uses the structure: \{\{ domain \}\}_\{\{ type \}\}. For docs_tutorial, docs_reference, www_guide, www_product.

{% enddocs %}


{% docs content_type %}

This field is used to group pages by the content on the page. This aligns with our content marketing pillars, which are constantly evolving. Examples of content types include analytics engineering, modern data stack, data careers, data teams, etc.

{% enddocs %}


{% docs status %}

The status of a page on our website. If the page is active, the status is `published`. If a page is no longer active, the status is `deprecated`.

{% enddocs %}


{% docs target_keyword %}

The keyword we are targeting a specific page on our website

{% enddocs %}


{% docs target_position %}

The average position we are targeting for the target keyword

{% enddocs %}


{% docs target_monthly_traffic %}

The total number of clicks we are targeting for a given target keyword

{% enddocs %}

{% docs googlesheets__proserv_feature_enablement_sessionsts %}

**Status:** Active

This spreadsheet tracks the enablement sessions that are held to train the proserv team on new feature releases. To view the spreadsheet, you can [click here](https://docs.google.com/spreadsheets/d/1ZkKtPxNMf7cIe8CEhSXKY3i1mFuufWFlOo4iaXs2vIY/edit#gid=0).

{% enddocs %}

{% docs googlesheets__proserv_utilization_targets %}

**Status:** Active

This spreadsheet tracks individual utilization targets for the Professional Services team. To view the spreadsheet, you can [click here](https://docs.google.com/spreadsheets/d/1L9_XglyaK_fGbjlW3jh1sMEdtJmysMJua80m6-0fEN0/edit#gid=0).

{% enddocs %}

{% docs customer_health %}

This model contains the configurations needed for the Customer Heatlh score. It contains mappings for the features that make up the score.
Every tab in [this Google Sheet](https://docs.google.com/spreadsheets/d/1R7aYq36PvlERx3CmBgQB6xXVgIOCIp7P6ZiiGtcOQIM/edit#gid=0) is a staging table used in the score.

{% enddocs %}

{% docs finance_job_ids %}

This model contains all Job IDs used by finance for planning hiring. Each Job ID is unique to the role not to the employee.

{% enddocs %}

{% docs terminated_employees %}

This model is sourced from ADP and contains all known existing and future terminations.

This model augments what is available from the Fivetran ADP extract in order to:
Process payroll from the data warehouse
Deprovision users in OKTA from the data warehouse

The current Fivetran ADP extract is insufficient for tracking terminated employees for these purposes because:
It can only identify employees that have already terminated (i.e. no future terminations)
It is prohibitively expensive and unnecessary to run the Fivetran ADP extract at the frequency required. For deprovisioning in OKTA and for processing payroll, we need to be able to refresh terminated employees hourly as well as on-demand.

The terminated employee information is currently going to be sourced from a googlesheet until Fivetran Lambda functions are officially approved to source this information.

This model should only be used by downstream operational processes that require this enhanced level of information.  For reporting and general purposes, the standard Fivetran ADP extract should be utilized.

{% enddocs %}

{% docs revenue_schedule_override_as_of_date %}
The applicable month-end of a particular override line.
{% enddocs %}