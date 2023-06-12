{%- set attribute_cols = [
    'gender_identity', 'ethnicity', 'disability', 'age_bucket',
    'caregiver', 'lgbtqia', 'highest_education', 'eeo_racial_identity',
    'dei_ethnicity_and_race'
]-%}

with

all_months as (

    select * from {{ ref('all_months') }}
    where date_month <= current_date()

),

person_attributes as (

    select * from {{ ref('int_dei_align_person_attributes') }}

),

org_and_classification as (

    select distinct
        org,
        technical_classification
    
    from person_attributes

),

spine as (

    select * from all_months
    cross join org_and_classification

),

pivoted_by_org_and_classification as (

    select 
        spine.date_month,
        spine.org,
        spine.technical_classification,

        {% for attribute_col in attribute_cols -%}


            {# Get distinct column values for attribute_col #}
            {%- set col_values = dbt_utils.get_column_values(
                table = ref('int_dei_align_person_attributes'),
                column = attribute_col
            ) -%}
            {% set columns_to_summarise = [] %}

                {# Iterate through column values to create sum statements #}
                {%- for col_value in col_values if col_value is not none-%}

                    {% set col_name = attribute_col ~ '__' ~ dbt_utils.slugify(col_value) %}
                    {% do columns_to_summarise.append(col_name) %}

                    {# Generate sum statements depending on column value #}
                    {%- if attribute_col[0:3] != 'eeo' %}

                        sum(
                            case
                                when {{ attribute_col }} = '{{ col_value | replace("'", "\\'") }}'
                                    then 1
                                else 0
                            end
                        ) as {{ col_name }},

                    {%- else %}

                        -- Only US employees for EEO reporting
                        sum(
                            case
                                when {{ attribute_col }} = '{{ col_value | replace("'", "\\'") }}' and is_worker_outside_of_usa = false
                                    then 1
                                else 0
                            end
                        ) as {{ col_name }},

                    {%- endif -%}

                {%- endfor %}
                
                {% if columns_to_summarise | length > 0 %}
                    {{ columns_to_summarise | join(" + ") }} as {{ attribute_col }}__total_responses{% if not loop.last %},{% endif %}
                {% endif %}

        {%- endfor %}

        from spine

    left join person_attributes
        on spine.org = person_attributes.org
        and spine.technical_classification = person_attributes.technical_classification
        -- An employee is counted from their first full month of employment
        -- until the end of the month they were terminated in ADP
        and spine.date_month >= person_attributes.hired_at
        and spine.date_month <= coalesce(person_attributes.terminated_at, current_date())
    group by 1, 2, 3

)

select * from pivoted_by_org_and_classification
