{% macro postgres_is_deleted(state, column_name) %}
    case
        when {{ state }} = 2
            then 1
        else 0
    end as {{column_name}}
{% endmacro %}