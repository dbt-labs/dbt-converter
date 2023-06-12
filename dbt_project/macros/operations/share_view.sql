{% macro share_view(share_name) %}
{#-
This macro assumes that the share already exists.
To create the share, run the following (as the account admin)

use role transformer
create share {{ share_name }};
grant usage on database analytics to share {{ share_name }};
grant reference_usage on database raw to share {{ share_name }};
alter share {{ share_name }} add accounts = <account_id>;

-#}

    {% if target.name == "prod" and execute %}

        {%- set is_secure_view=
            model['config']['materialized'] == 'view'
            and model['config']['secure'] == True
        -%}

        {% if not is_secure_view %}
            {% do exceptions.raise_compiler_error(model['name'] ~ " must be a secure view") %}
        {% endif %}

        {%- set is_in_export_schema = this.schema.startswith('shared_') -%}

        {% if not is_in_export_schema %}
          {% do exceptions.raise_compiler_error(model['name'] ~ " must be in a schema prefixed with `shared_`. Currently in " ~ this.schema ) %}
        {% endif %}

        {% set sql %}
            grant usage on schema {{ this.database }}.{{ this.schema }} to share {{ share_name }};
            grant select on view {{ this }} to share {{ share_name }}
        {% endset %}

        {% set table = run_query(sql) %}

  {% endif %}

{% endmacro %}