{% docs src_jira %}

**Status**: Active

InfoSec and Engineering use Jira to track all issues via their project boards.

Fivetran runs an extraction on this data source every 3hr. To understand how these staging models connect with each other, check out [Fivetran's Jira ERD](https://docs.google.com/presentation/d/1UPq2CWnqQpbjLxkTrcWvAekaZ0o0OdzXODTVmUXeGvs/).

{% enddocs %}


{% docs jira_issue_assignee_user_id %}
Foreign key referencing the ID of the `user` currently assigned to this task.
{% enddocs %}

{% docs jira_issue_created_at %}
Timestamp of when the issue was created (in UTC).
{% enddocs %}

{% docs jira_issue_creator_user_id %}
Foreign key referencing the `user` who first created the issue. Cannot be changed.
{% enddocs %}

{% docs jira_issue_issue_description %}
The issue description, if given.
{% enddocs %}

{% docs jira_issue_due_date %}
Calendar day on which the issue is due, if a due date is provided.
{% enddocs %}

{% docs jira_issue_environment %}
Text field describing the environment in which the issue occurred (ie "IE9 on Windows 7").
{% enddocs %}

{% docs jira_issue_issue_type_id %}
Foreign key referencing the ID of the `issue_type`. 
{% enddocs %}

{% docs jira_issue_issue_key %}
UI-facing id of the issue.
{% enddocs %}

{% docs jira_issue_original_estimate_seconds %}
The original estimate of how long working on this issue would take, in seconds.
{% enddocs %}

{% docs jira_issue_parent_issue_id %}
Self-referencing ID of the parent `issue`. 
{% enddocs %}

{% docs jira_issue_priority_id %}
Foreign key referencing the ID of the issue's current `priority`.
{% enddocs %}

{% docs jira_issue_project_id %}
Foreign key referencing the ID of the `project` that the issue belongs to.
{% enddocs %}

{% docs jira_issue_remaining_estimate_seconds %}
The estimate of how much longer working on this issue will take, in seconds.
{% enddocs %}

{% docs jira_issue_reporter_user_id %}
Foreign key referencing the ID of the `user` who reported the issue. This differs from the `creator` column in that the reporter can be changed in-app.
{% enddocs %}

{% docs jira_issue_resolution_id %}
Foreign key referencing the ID of the issue's type of `resolution`.
{% enddocs %}

{% docs jira_issue_resolved_at %}
Timestamp of when the issue was resolved (ie completed, marked as duplicate). If an issue is un-resolved, this will be null.
{% enddocs %}

{% docs jira_issue_status_id %}
Foreign key referencing the ID of the issue's `status` (the step that the issue is currently at in the project's workflow).
{% enddocs %}

{% docs jira_issue_status_changed_at %}
Timestamp of when the status was last changed.
{% enddocs %}

{% docs jira_issue_issue_name %}
Title of the issue.
{% enddocs %}

{% docs jira_issue_time_spent_seconds %}
The time that was spent working on this issue, in seconds.
{% enddocs %}

{% docs jira_issue_updated_at %}
Timestamp of when the issue was last updated in some way.
{% enddocs %}

{% docs jira_issue_work_ratio %}
The percentage of work that has been logged against the issue (time_spent) vs the original estimate of worktime. Equals -1.0 when the fields required for calculation are not provided.
{% enddocs %}