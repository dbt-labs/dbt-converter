{%- macro grant_transformer_to_users(lookback_hours = 6, test = true) -%}

    {# Users added within last lookback #}
    {%- set users = dbt_utils.get_column_values(
        table = ref('stg_snowflake__users'),
        column = 'name',
        where = 'is_service_account = false and hours_since_user_created <= ' ~ lookback_hours
    ) -%}

    {# Elevate to role with Manage Grants permission #}
    {{ use_role(role = 'automated_useradmin', test = test) }}

    {%- if users is not none -%}

        {%- for user in users -%}
            
            {# Check if user has transformer role #}
            {%- set show_grants_sql -%}

                show grants to user "{{ user }}"

            {%- endset -%}
            {%- set grants = dbt_utils.get_query_results_as_dict(show_grants_sql) -%}
            {%- set has_transformer = 'TRANSFORMER' in grants['role'] -%}

            {# Provision transformer role #}
            {%- if not has_transformer -%}

                {%- set grant_role_sql -%}
                    grant role transformer to user "{{ user }}"
                {%- endset -%}

                {# Dynamic message based on test argument #}
                {%- if test == true -%}

                    {%- set log_mode = 'Running in test mode. Query: ' -%}

                {%- else -%}

                    {%- set log_mode = 'Running in execute mode. Query: ' -%}

                {%- endif -%}

                {# Log message #}
                {{ log(log_mode ~ grant_role_sql, info = true) }}

                {# Submit query if not in test mode #}
                {%- if not test -%}

                    {%- do run_query(grant_role_sql) -%}
                    
                {%- endif -%}

            {%- endif -%}

        {%- endfor -%}

    {%- else -%}

        {{ log('No new users needing the transformer role in the lookback window.', info = true) }}

    {%- endif -%}

{%- endmacro -%}