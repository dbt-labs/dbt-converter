{#
This macro contains the logic for adding scores from the Google Sheet to the customer health score.
The joins themselves are pretty much all the same, they only different in certain spots. 
Every metric in the Google Sheet has to be joined this way, so centralizing it here saves code space.
#}
{% macro customer_health_join(score_metrics=None) %}

    {# Query table to see what is market segment dependant #}
    {% set market_segment_list = dbt_utils.get_column_values(
        table = ref('stg_googlesheets__customer_health_score_buckets'),
        column = 'general_metric',
        where = "market_segment ilike any ('enterprise','commercial')"
    )%}


    {% set join_list = [] %}

    {# Loop through dict defined in model file and create a join statement for each metric #}
    {% for category, category_value in score_metrics.items() %}

        {% set output_join %}
            left join scoring_combined as {{ category }} on
                    {{ category }}.general_metric = '{{ category }}'
                    {#- This loops through join columns in case there are multiple -#}
                    {%- if category_value.join_column is mapping %}
                        {% for bucket, column_name in category_value.join_column.items() -%}
                            and customer_health_calcs.{{ column_name }} between {{ category }}.{{ bucket }}_min and {{ category }}.{{ bucket }}_max
                        {% endfor -%}
                    {%- else %}
                        and customer_health_calcs.{{ category_value.join_column }} between {{ category }}.bucket_min and {{ category }}.bucket_max
                    {% endif -%}
                    and customer_health_calcs.sales_motion = {{ category }}.sales_motion
                    and customer_health_calcs.sales_motion = {{ category }}.category_sales_motion
                    and customer_health_calcs.sales_motion = {{ category }}.overall_sales_motion
                    {# If the score uses market segment, add that join #}
                    {% if category in market_segment_list -%}
                        and customer_health_calcs.score_market_segment = {{ category }}.market_segment
                    {%- endif %}
        {% endset %}

        {{ join_list.append(output_join) }}

    {% endfor %}

    {% set result = join_list | join('') %}


    {{ return(result) }}

{% endmacro %}