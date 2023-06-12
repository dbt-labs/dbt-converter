{% docs fct_dbt_package_installs %}
One record per "dbt run" or "dbt deps" command, per package installed. For example, if a
project uses three packages, there will be three events listed here.

Times when a "dbt deps" command is invoked:
  - Manual: When someone is developing locally, and manually runs the command
  - Manual: When someone is developing in the IDE, and manually runs the command
  - Scheduled: At the start of every scheduled dbt Cloud run
  - Scheduled: As part of a scheduled dbt job orchestrated outside of dbt

The most meaningful way to analyze this data is to count the number of
distinct dbt core `project_id`s using a package, or to link it abck to it's invocation using `invocation_id`.

¹Prior to v0.17.0, package names were always hashed when sent to dbt. As of
v0.17.0, packages installed via dbt hub now record the package name, e.g.
`fishtown-analytics/dbt_utils`.

Fortunately, we can also apply the same hash to our list of known packages,
and join on that to decrypt the names of packages installed via the hub, or
by git URL (though for some reason, there are still some we haven't been
able to match — since I'm not a cryptographer I'm going to call it a day!).
{% enddocs %}

{% docs dbt_invocations %}
All invocations that occur within dbt Cloud are tracked. Users can opt out of anonymous usage tracking when using the CLI
([docs](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile#usage-statistics)).
{% enddocs %}

{% docs dbt_minor_version %}
E.g. [**0.16**](https://github.com/fishtown-analytics/dbt/releases/tag/v0.16.0), [**0.17**](https://github.com/fishtown-analytics/dbt/releases/tag/v0.17.0). These are releases with breaking changes, requiring some effort for end users to upgrade.
{% enddocs %}

{% docs dbt_project_complexity %}
Until we have more granular feature tracking, project complexity is defined as:

- **3** = custom materialization; non-Cloud RPC invocations; defined exposures; <500 models
- **2** = incremental models; snapshot, archive, snapshot-freshness, run-operation; >100 models
- **1** = none of the above
{% enddocs %}

{% docs dbt_project_invocations %}
How many invocations
{% enddocs %}

{% docs dbt_project_active %}
**1 or 0.** Has there been at least one invocation
{% enddocs %}

{% docs dbt_project_changed %}
**1 or 0.** Have there been any new or changed models in this project
{% enddocs %}

{% docs dbt_project_mature %}
**1 or 0.** Have 95+% of the models in this project remained unchanged
{% enddocs %}

{% docs dbt_docs_sessions %}
How many sessions has this user had on the dbt docs site
{% enddocs %}

{% docs dbt_docs_active %}
**1 or 0.** Has this user viewed the dbt docs site
{% enddocs %}

{% docs dbt_docs_time_engaged_in_s %}
How many total seconds did this user spend on the dbt docs site
{% enddocs %}

{% docs adapter_support %}
One of "core", "fishtown_supported" and "community_supported".
{% enddocs %}

{% docs adapter_label %}
A field to be used in the visualization layer to track use of the main
adapters over time. Core adapters are labelled with the adapter type,
whereas non-core adapters are grouped into "other"
{% enddocs %}

{% docs dbt_resource_counts %}
As of v0.19.1, all dbt invocations fire an event that includes the total
counts of each resource type in the project. If you've used the dbt CLI,
you're probably familiar with:
```
Running with dbt=0.19.1
Found 259 models, 409 tests, 3 snapshots, 1 analysis, 407 macros, 1 operation, 14 seed files, 82 sources, 5 exposures
```
This is that! Note that this includes _all_ the resources in the active project,
including those from installed packages and (in the case of macros) from the global dbt project.
{% enddocs %}

{% docs model_complexity %}
Until we have more granular feature tracking, complexity is defined as:

- **3** = custom materialization; non-Cloud RPC invocations; defined exposures;
- **2** = incremental models; snapshot, archive, snapshot-freshness, run-operation;
- **1** = none of the above

{% enddocs %}

{% docs count_models %}
A count of models included in the command
{% enddocs %}

{% docs count_changed %}
A count of models deemed changed (determined by whether they differed 
from the mode of model language within the same date)
{% enddocs %}

{% docs count_skip %}
A count of models included in the command that were skipped during the run
{% enddocs %}

{% docs count_error %}
A count of models included in the command that resulted in an error during the run
{% enddocs %}

{% docs count_succeed %}
A count of models included in the command that completed successfully during the run
{% enddocs %}

{% docs count_view_models %}
A count of models included in the command that were materialized as a view
{% enddocs %}

{% docs count_table_models %}
A count of models included in the command that were materialized as a table
{% enddocs %}

{% docs count_incremental_models %}
A count of models included in the command that were materialized using an incremental pattern
{% enddocs %}

{% docs count_custom_materialization_models %}
A count of models included in the command that were materialized in a custom pattern
{% enddocs %}

{% docs count_seeds %}
A count of seeds included in the command
{% enddocs %}

{% docs count_snapshots %}
A count of snapshots included in the command
{% enddocs %}

{% docs count_python %}
A count of python models included in the command
{% enddocs %}

{% docs languages_used %}
A count of distinct programming languages used
{% enddocs %}
