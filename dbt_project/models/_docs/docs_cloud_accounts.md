{% docs cloud_plan_tier %}

An identifier to group specific plans by targeted user groups. As an example, this field allows
for tracking on reporting on the general grouping of Team plans across changes in pricing and 
plan features

{% enddocs %}

{% docs cloud_plan %}

The plan name representing the pricing and features for a given Cloud account. If there are multiple 
Cloud accounts associated with a given Salesforce account, this represents the plan applicable to the 
primary Cloud account. Note that go-to-market plan names persisted through pricing changes are reflected as
as separate values (e.g. team and team_2022).

{% enddocs %}

{% docs database_source %}

The source Postgres database the Cloud account information comes from.
For US Multi-Tenant, this is `cloud`.
For EMEA Multi-Tenant, this is `cloud_emea`.
For AU Multi-Tenant, this is `cloud_au`.
And for Single-Tenant, this would be the ST-specific name extracted from database schema, i.e. `usaa_prod`.

{% enddocs %}