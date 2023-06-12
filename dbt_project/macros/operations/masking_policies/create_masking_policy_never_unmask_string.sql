{#
    This macro should only be used as a last resort, when column hashing or
    other methods for avoiding ingesting unnecessary data are unavailable.
#}

{%- macro create_masking_policy_never_unmask_string(node_database, node_schema) -%}

    create masking policy if not exists {{ node_database }}.{{ node_schema }}.never_unmask_string as (val string)
        returns string ->
          null

{%- endmacro -%}