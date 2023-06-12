{% macro plan_tiering(plan_name) %}

case
    when RIGHT( {{ plan_name }}, 5 ) ='_2022'
        then split_part({{ plan_name }},'_',1)
    else {{ plan_name }}
end 

{% endmacro %}