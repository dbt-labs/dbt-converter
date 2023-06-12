{% docs dbt_is_partial_parse_enabled %}
Is [partial parsing](https://docs.getdbt.com/reference/profiles.yml/#partial_parse) enabled for this user, via profile config or CLI flag? N.B. All dbt Cloud IDE invocations use partial parsing.
{% enddocs %}

{% docs dbt_project_load_all_elapsed_s %}
The total number of seconds between submitting a dbt command and beginning the task (running a model, test, seed, etc). This includes parsing all project files, patching sources, and compiling the manifest.
{% enddocs %}

{% docs dbt_project_path_count %}
The number of dbt resource files (`.sql`, `.yml`, etc) in the root project and all installed packages.
{% enddocs %}

{% docs dbt_project_parsed_path_count %}
The number of dbt resource files actually parsed in this invocation. We measure partial parsing efficacy as project_parsed_path_count / project_path_count.
{% enddocs %}
