
{% macro case_insensitive_substr(col, regex, grp) %}
    REGEXP_SUBSTR({{col}}, {{regex}}, 1, 1, 'ie', {{ grp | default("1", true)}})
{% endmacro %}

