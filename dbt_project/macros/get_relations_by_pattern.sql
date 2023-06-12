{% macro get_relations_by_pattern(schema_pattern, table_pattern, exclude='', database=target.database, quote_table=False) %}
    -- This uses the version of get_relations_by_pattern found in this project
    -- and not the one in dbt-utils. This is because we need to handle table
    -- quoting manually because of a table name we have in the project. We can
    -- swap back to the package when we have the functionality shipped in a
    -- future version.
    
    {{ return(adapter.dispatch('get_relations_by_pattern', 'dbt_utils')(schema_pattern, table_pattern, exclude, database, quote_table)) }}
{% endmacro %}

{% macro default__get_relations_by_pattern(schema_pattern, table_pattern, exclude='', database=target.database, quote_table=False) %}

    {%- call statement('get_tables', fetch_result=True) %}

      {{ dbt_utils.get_tables_by_pattern_sql(schema_pattern, table_pattern, exclude, database) }}

    {%- endcall -%}

    {%- set table_list = load_result('get_tables') -%}

    {%- if table_list and table_list['table'] -%}
        {%- set tbl_relations = [] -%}
        {%- for row in table_list['table'] -%}
            {% if row.table_schema not in( var('single-tenant-exclusions') ) %}
                {% if quote_table %}
                {% set table_name = '"' ~ row.table_name ~ '"' %}
                {% else %}
                {% set table_name = row.table_name %}
                {% endif %}
                {%- set tbl_relation = api.Relation.create(
                    database=database,
                    schema=row.table_schema,
                    identifier=table_name,
                    type=row.table_type
                ) -%}
                {%- do tbl_relations.append(tbl_relation) -%}
            {% endif %}
        {%- endfor -%}

        {{ return(tbl_relations) }}
    {%- else -%}
        {{ return([]) }}
    {%- endif -%}

{% endmacro %}