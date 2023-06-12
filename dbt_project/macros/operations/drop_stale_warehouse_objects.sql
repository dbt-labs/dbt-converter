{%- macro drop_stale_warehouse_objects(
    days_stale, database = 'analytics', exclude_schemas = none,
    exclude_incrementals = true, exclude_snapshots = true, test = true
) -%}

    {# Raise a compiler error for invalid values passed to `days_stale` #}
    {%- if days_stale is not integer -%}

        {{ exceptions.raise_compiler_error('days_stale must be an integer') }}

    {%- endif -%}

    {%- if execute -%}

        {# Build the `where` clause from arg values #}
        {%- set where_clause = '' -%}

        {# Compile not in statement for excluded schemas #}
        {%- if exclude_schemas is not none -%}

            {%- set where_clause = where_clause ~ " and table_schema not in ('" ~ exclude_schemas | join("','") | upper ~ "')" -%}

        {%- endif -%}

        {# Compile not in statement for models with incremental materialization configurations #}
        {%- if exclude_incrementals -%}

            {%- set incremental_nodes = []-%}
            {%- for node in graph.nodes.values()
                | selectattr("resource_type", "equalto", "model")
                | selectattr("config.materialized", "equalto", "incremental")
            %}

                {% do incremental_nodes.append(node.name | upper) %}

            {%- endfor %}

            {# Append where clause if there are incremental models #}
            {%- if incremental_nodes | length > 0 -%}

                {%- set where_clause = where_clause ~ " and table_name not in ('" ~ incremental_nodes | join("','") ~ "')" -%}

            {%- endif -%}

        {%- endif -%}

        {# Compile not in statement for snapshots schema #}
        {%- if exclude_snapshots -%}

            {%- set where_clause = where_clause ~ " and table_schema != 'SNAPSHOTS'" -%}

        {%- endif -%}

        {# Query to identify objects meeting staleness criteria #}
        {%- set drop_statements_query -%}

            with

            stale_tables as (

                select
                    table_catalog as database,
                    table_schema as schema,
                    table_name,
                    case
                        when table_type = 'BASE TABLE'
                            then 'table'
                        when table_type = 'VIEW'
                            then 'view'
                    end as type,
                    created as created_at,
                    last_altered as last_altered_at

                from {{ database }}.information_schema.tables
                where last_altered < dateadd('days', -{{ days_stale }}, current_timestamp)
                {{ where_clause }}

            ),

            stale_views as (

                select
                    table_catalog as database,
                    table_schema as schema,
                    table_name,
                    'view' as type,
                    created as created_at,
                    last_altered as last_altered_at

                from {{ database }}.information_schema.views
                where last_altered < dateadd('days', -{{ days_stale }}, current_timestamp)
                {{ where_clause }}

            ),

            unioned as (

                select * from stale_tables
                union
                select * from stale_views

            ),

            final as (

                select distinct
                    'drop ' || type || ' ' || database || '.' || schema || '.' || table_name || ';'

                from unioned

            )

            select * from final

        {%- endset -%}

        {# Submit query #}
        {%- set drop_statements_results = run_query(drop_statements_query) -%}

        {# Dynamic message based on test argument #}
        {%- if test == true -%}

            {%- set log_mode = 'Running in test mode. Query: ' -%}

        {%- else -%}

            {%- set log_mode = 'Running in execute mode. Query: ' -%}

        {%- endif -%}

        {%- set drop_statements = drop_statements_results.columns[0].values() -%}
        {%- for drop_statement in drop_statements -%}

            {# Log message #}
            {{ log(log_mode ~ drop_statement, info = true) }}

            {# Submit drop query if not in test mode #}
            {%- if not test -%}

                {%- do run_query(drop_statement) -%}

            {%- endif -%}

        {%- endfor -%}

    {%- endif -%}

{%- endmacro -%}