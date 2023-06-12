{% macro epoch_to_timestamp(column_name, time_unit='seconds') %}
    dateadd({{ time_unit }}, {{ column_name }}, '1970-01-01')
{% endmacro %}
