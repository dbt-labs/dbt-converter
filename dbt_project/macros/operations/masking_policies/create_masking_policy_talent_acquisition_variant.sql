{%- macro create_masking_policy_talent_acquisition_variant(node_database, node_schema) -%}

    create masking policy if not exists {{ node_database }}.{{ node_schema }}.talent_acquisition_variant as (val variant)
        returns variant ->
         case
            when current_user() in ('CI_USER', 'DBT_CLOUD_USER', 'PIGMENT') 
                then val
            when current_role() in ('TRANSFORMER_MASKING_TALENT_ACQUISITION') 
                then val
            else null
        end

{%- endmacro -%}