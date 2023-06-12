/*
This test is a lil bit redundant, given that it's comparing against the dim_employees model which is a grandparent of the model and there shouldn't be any changes to the grain. 
But, since there are no uniqueness tests because we're removing unique IDs and rolling everything up, I feel better having it around just in case.
*/

with employees as (
    select 
        org, 
        technical_classification, 
        count(*) as num_employees
    from {{ ref('dim_employees') }}
    where coalesce(official_termination_date, '{{ var("future_proof_date") }}') >= date_trunc(month, getdate())
    and is_most_recent_employee_record
    group by 1, 2
),
summary_cols_unpivoted as (
    {%- set summary_columns = [] %}
    {%- for col in dbt_utils.get_filtered_columns_in_relation(ref('rpt_demographics_by_department')) %}
        {%- if '__total_responses' in col.lower() %}
            {%- do summary_columns.append(col) %}
        {%- endif %}
    {%- endfor %}
    {%- for col in summary_columns %}
        select 
            org,
            technical_classification,
            '{{ col }}' as demographic,
            {{ col }} as demographic_total_responses
        from {{ ref('rpt_demographics_by_department') }}
        where date_month = date_trunc(month, getdate())

       {% if not loop.last %} union all {% endif %}
    {% endfor %}
),

failing_rows as (
    select 
        employees.org, 
        employees.technical_classification,
        employees.num_employees,
        summary_cols_unpivoted.demographic,
        summary_cols_unpivoted.demographic_total_responses
    from employees
    full outer join summary_cols_unpivoted on employees.org = summary_cols_unpivoted.org
        and employees.technical_classification = summary_cols_unpivoted.technical_classification
    where coalesce(employees.num_employees, 0) < coalesce(summary_cols_unpivoted.demographic_total_responses, 0)
)

select * 
from failing_rows