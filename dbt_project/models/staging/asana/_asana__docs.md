{% docs src_asana %}
**Status:** Active

We use Asana for all project and task management at dbt Labs. The Professional Services team also uses Asana for tracking all Enterprise sprints and sprint details (e.g. Sprint owner, cost, start date and end date, etc). For cards across any project, we can bring in any custom field and they will be prefixed with `custom_<field_name>` (e.g. `custom_est hours`, `custom_request_type`).

Fivetran runs an extraction on this data source every 3hr. To understand how these staging models connect with each other, check out [Fivetran's Asana ERD](https://docs.google.com/presentation/d/14m2L2aYGmt0IXseExR80FlEO-7fxjBKfoALR2jVh0G8/edit#slide=id.p). We were previously adding individual projects, but in order to capture projects as Pro-Serv adds them, we updated the connector to sync all projects.

{% enddocs %}