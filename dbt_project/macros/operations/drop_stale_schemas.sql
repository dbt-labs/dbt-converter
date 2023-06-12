{%- macro drop_stale_schemas(
    days_stale, database, exclude_schemas = none, test = true
) -%}

    {# Raise a compiler error for invalid values passed to `days_stale` #}
    {%- if days_stale is not integer -%}

        {{ exceptions.raise_compiler_error('days_stale must be an integer') }}

    {%- endif -%}

    {# Raise a compiler error if executed against the production database #}
    {%- if database | lower == 'analytics' -%}

        {{ exceptions.raise_compiler_error('database must not equal analytics') }}

    {%- endif -%}

    {%- if execute -%}
        {# Compile not in statement for excluded schemas #}
        {%- if exclude_schemas is not none -%}

            {%- set where_clause = "where table_schema not in ('" ~ exclude_schemas | join("','") | upper ~ "')" -%}

        {%- endif -%}

        {# Query to identify schemas meeting staleness criteria #}
        {%- set drop_statements_query -%}
            with

            max_last_altered_tables as (

                select
                    table_catalog as database,
                    table_schema as schema,
                    max(last_altered) as last_altered_at

                from {{ database }}.information_schema.tables
                {{ where_clause }}
                group by 1, 2

            ),

            max_last_altered_views as (

                select
                    table_catalog as database,
                    table_schema as schema,
                    max(last_altered) as last_altered_at

                from {{ database }}.information_schema.views
                {{ where_clause }}
                group by 1, 2

            ),

            unioned as (

                select * from max_last_altered_tables
                union all
                select * from max_last_altered_views

            ),

            stale_schemas as (

                select
                    database,
                    schema,
                    max(last_altered_at) as max_last_altered_at
                
                from unioned
                group by 1, 2
                having max_last_altered_at < dateadd('days', -{{ days_stale }}, current_timestamp)

            ),

            final as (

                select distinct
                    'drop schema ' || database || '.' || schema || ';'

                from stale_schemas

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