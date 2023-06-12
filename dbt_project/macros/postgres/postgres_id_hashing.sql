--NOTE: In Phase 2, we will be removing this conditional logic and apply this to multi-tenant accounts as well
-- atom 4/18: tenant can imply 'cloud_emea' or 'cloud_au' original id as well

{%- macro id_hashing(original_column_name, renamed_column_name=none) -%}

    {%- set column_name = renamed_column_name if renamed_column_name is not none else original_column_name -%}

      case
          when database_source = 'cloud'
                then {{ original_column_name }}::varchar
          else md5(database_source || {{ original_column_name }})
      end as {{ column_name }},

      {{ original_column_name }} as tenant_{{ column_name }}
  
{%- endmacro -%}