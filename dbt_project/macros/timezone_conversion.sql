{% macro timezone_conversion(timestamp_name) %}

    {{ timestamp_name }} as {{ timestamp_name }}__og,
    convert_timezone(
      'UTC',
      {{ timestamp_name }}
    ) as {{ timestamp_name }}__ntz

{% endmacro %}
