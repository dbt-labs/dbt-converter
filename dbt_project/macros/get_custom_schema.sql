{% macro generate_schema_name(schema_name, node) -%}
    {{ generate_schema_name_for_env(schema_name) }}
{%- endmacro %}

{% macro generate_alias_name(custom_alias_name=none, node=none) -%}
    {#- Only use the alias in prod #}
    {%- if target.name == 'prod' and custom_alias_name is not none -%}

        {{ return(custom_alias_name | trim) }}

    {%- else -%}

        {{ return(node.name) }}
        
    {%- endif -%}

{%- endmacro %}