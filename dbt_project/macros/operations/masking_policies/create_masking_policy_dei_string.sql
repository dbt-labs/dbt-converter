{# this returns null instead of a string 
because some of them are strings containing 
timestamp data that can't be cast otherwise #}

{%- macro create_masking_policy_dei_string(node_database, node_schema) -%}

    create masking policy if not exists {{ node_database }}.{{ node_schema }}.dei_string as (val string)
        returns string ->
         case
            when current_user() in ('CI_USER', 'DBT_CLOUD_USER') 
                then val
            when current_role() in ('TRANSFORMER_MASKING_DEI')
                then val
            else null
        end

{%- endmacro -%}