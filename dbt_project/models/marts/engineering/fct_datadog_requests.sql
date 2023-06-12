{%- set instances = ['multitenant', 'singletenant'] -%}

with

{% for instance in instances %}

    {{ instance }}_total_requests as (

        select * from {{ ref('stg_datadog__aws_' ~ instance ~ '_total_requests') }}

    ),

    {{ instance }}_elb_errors as (

        select * from {{ ref('stg_datadog__aws_' ~ instance ~ '_elb_error_requests') }}

    ),

    {{ instance }}_target_errors as (

        select * from {{ ref('stg_datadog__aws_' ~ instance ~ '_target_error_requests') }}

    ),

{%- endfor %}

{% for instance in instances %}

    all_{{ instance }}_requests as (

        select 
            {{ instance }}_total_requests.instance_type,
            {{ instance }}_total_requests.dbt_instance,
            {{ instance }}_total_requests.requests_date,
            {{ instance }}_total_requests.daily_requests_total,
            {{ instance }}_elb_errors.elb_error_requests_total,
            {{ instance }}_target_errors.target_error_requests_total,
            (
                {{ instance }}_elb_errors.elb_error_requests_total + 
                {{ instance }}_target_errors.target_error_requests_total
            ) / nullif({{ instance }}_total_requests.daily_requests_total, 0) as percent_successful_requests

        from {{ instance }}_total_requests
        left join {{ instance }}_elb_errors
            on {{ instance }}_total_requests.dbt_instance = {{ instance }}_elb_errors.dbt_instance
            and {{ instance }}_total_requests.requests_date = {{ instance }}_elb_errors.requests_date
        left join {{ instance }}_target_errors
            on {{ instance }}_total_requests.dbt_instance = {{ instance }}_target_errors.dbt_instance
            and {{ instance }}_total_requests.requests_date = {{ instance }}_target_errors.requests_date

    ),

{%- endfor %}

unioned as (

    {% for instance in instances %}

    select * from all_{{ instance }}_requests
    {% if not loop.last %}union{% endif %}

    {%- endfor %}

)

select * from unioned
