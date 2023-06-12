{%- macro reset_dev_env(from_schema, from_database='analytics') -%}

    {%- if target.name in ['dev', 'default'] -%}

        {%- set sql -%}
            drop schema if exists {{ target.database }}.{{ target.schema }} cascade;
        {%- endset -%}

        {{ log("Dropping target schema.", info = true) }}

        {%- do run_query(sql) -%}

        {{ log("Dropped target schema.", info = true) }}

        {{ clone_prod_to_target(from_schema, from_database) }}

    {%- else -%}

        {{ exceptions.raise_compiler_error("No-op: your current target is " ~ target.name ~ ". This macro only works for a dev target.") }}

    {%- endif -%}

{%- endmacro -%}

{%- macro clone_prod_to_target(from_schema, from_database='analytics') -%}

    {# The role that executes these statements will be the owner of the created schema and objects #}
    {%- set sql -%}
        create schema if not exists {{ target.database }}.{{ target.schema }} clone {{ from_database }}.{{ from_schema }} with managed access;
    {%- endset -%}

    {{ log("Cloning schema " ~ from_database ~ "." ~ from_schema ~ " into " ~ target.database | lower ~ "." ~ target.schema, info = true) }}

    {%- do run_query(sql) -%}

    {{ log("Cloned schema " ~ from_database ~ "." ~ from_schema ~ " into " ~ target.database | lower ~ "." ~ target.schema, info = true) }}

    {%- set sql_grants -%}
        grant ownership on all tables in schema {{ target.database }}.{{ target.schema }} to role {{ target.role }} copy current grants;
        grant ownership on all views in schema {{ target.database }}.{{ target.schema }} to role {{ target.role }} copy current grants;
    {%- endset -%}

    {{ log("Transferring ownership to " ~ target.role | lower ~ ".", info = true) }}

    {%- do run_query(sql_grants) -%}

    {{ log("Transferred ownership to " ~ target.role | lower ~ ".", info = true) }}

{%- endmacro -%}
