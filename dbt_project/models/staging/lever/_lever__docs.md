{% docs src_lever %}
**Status:** Active

We use Lever as our hiring and interviewing management system at dbt Labs. For this source, we do not reveal any confidential employee/interview information. This source is only used to track our hiring headcounts and how many applicants/candidates are in each stage.

All candidates are labeled as "Opportunities" and we mark them as hired when they reach the "Hired" archival reason. We do not pull any additional information outside of this.

If you'd like to see more hiring data from Lever (e.g. how many applicants are applying for your team's open role, your current hiring pipeline), please inform the data team in #internal-analytics.

Fivetran runs an extraction on this data source every 3hr. To understand how these staging models connect with each other, check out [Fivetran's Lever ERD](https://docs.google.com/presentation/d/1tBzVXX4m7P-6U3TR8QCjjbV7cVhD63QbeZJ8qmfqB2s/edit).

{% enddocs %}


{% docs lever_stage_bucketed %}
Stages bucketed by the interview type. This specifically applies to Task/Technical Interview and Background/Reference Checks.
{% enddocs %}

{% docs lever_stage_pipeline %}
Application stages grouped by where they are in the pipeline: 1. Pre-Pipeline (i.e. recruiting, new applicants), 2. Interview, 3. Pre-Offer (Check-In Calls), 4. Offer, 5. Post-Offer (background/reference checks), 6. Hired, and 7. Archived (if they did not move forward in the interview process).
{% enddocs %}

{% docs lever_stage_index %}
This is a utils field for ordering stage names in Looker.
{% enddocs %}

{% docs lever_stage_bucketed_index %}
This is a utils field for ordering bucketed stages in Looker.
{% enddocs %}

