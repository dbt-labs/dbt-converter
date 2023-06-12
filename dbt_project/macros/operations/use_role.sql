{%- macro use_role(role, test = true) -%}
    {%- if target.user != 'dbt_cloud_user' -%}
        {{ exceptions.raise_compiler_error(
            'Role changes only work for service accounts that access Snowflake with a username + password.'
        ) }}
    {%- endif -%}

    {%- set sql = 'use role ' ~ role -%}
    
    {# Dynamic message based on test argument #}
    {%- if test == true -%}

        {%- set log_mode = 'Running in test mode. Query: ' -%}

    {%- else -%}

        {%- set log_mode = 'Running in execute mode. Query: ' -%}

    {%- endif -%}

    {# Log message #}
    {{ log(log_mode ~ sql, info = true) }}

    {# Submit query if not in test mode #}
    {%- if not test -%}

        {%- do run_query(sql) -%}
        
    {%- endif -%}

{%- endmacro -%}