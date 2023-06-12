{%- macro create_masking_policy_dev_string(node_database, node_schema) -%}

    create masking policy if not exists {{ node_database }}.{{ node_schema }}.dev_string as (val string)
        returns string ->
         case
            when current_role() in ('TRANSFORMER_MASKING_DEV')
                then val
            else '*****'
        end

{%- endmacro -%}