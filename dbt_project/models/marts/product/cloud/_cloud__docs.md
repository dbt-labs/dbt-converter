{% docs fct_cloud_account_activities %}

This model helps BI users calculate daily, weekly, and monthly active account metrics on top of our Cloud account activity data. Activity metrics are measured the `fct_web_pageviews` (for general activity), `fct_cloud_ide_sessions` for IDE sessions/development usage, and `dbt_docs_sessions` for docs usage/activity. This follows similar logic as our other existing activity models (e.g. `fct_dbt_project_activty` and `fct_slack_user_account_activity`).

Note: This only contains verified accounts (i.e. Cloud Accounts with at least one verified user, meaning they verified their email). This removes any spam accounts from this model.
{% enddocs %}


{% docs fct_cloud_user_activity %}

This model helps BI users calculate daily, weekly, and monthly active user metrics on top of our Cloud user activity data. It is built via the `fct_web_pageviews` model. This follows similar logic as our other existing activity models (e.g. `fct_dbt_project_activty` and `fct_slack_user_activty`).

Note: User activity, as defined in this model, represents user behaviors that occur inside of dbt Cloud's web application and are thereby captured as page views. User activity does not include asynchronous actions, such as scheduled runs.

{% enddocs %}

{% docs fct_cloud_user_group_permissions %}

**NOTE: This model only applies to multi-tenant clients today. Once RBAC is live for single-tenant, we will revert this filter (Brandon @ 4/19/2022)**

This model contains 1 row per user per group permission. It is reflective of the current state of that user's permissions, meaning it does not include deleted users, groups, permissions, accounts, or projects. Of note, permissions are granted via *permission sets*. These permission sets are applied to *groups* and pertain to *projects*. As a result, this model can be used to segment users by their assigned permissions on either a dbt Cloud account or project. Group permissions include both license-based access control and role-based access control (RBAC) permission sets. Below is how each of these are currently defined:

> **License-based Access Controls:** User are configured with account-wide license types. These licenses control the specific parts of the dbt Cloud application that a given user can access.

> **Role-based Access Control (RBAC):** Users are assigned to groups that have specific permissions on specific projects or the entire account. A user may be a member of multiple groups, and those groups may have permissions on multiple projects.

For more information on group permissions check out our product [docs regarding access control](https://docs.getdbt.com/docs/dbt-cloud/access-control/access-control-overview).

{% enddocs %}

{% docs active_cloud_account_definition %}
**Last Updated At:** 26 Sept 2022
**by:** Ian Fahey, Andrew Tom

The definition of an active cloud account is likely to evolve with the product itself. 
Changes to the criteria should be confirmed with the data team at large and likely
leadership stakeholders as active account metrics are surfaced to the board of directors. 

Currently, the definition includes at least one of the following: 
- having successful job runs

Additional criteria being considered include: 
- logging into Cloud
- using the IDE


{% enddocs %}

