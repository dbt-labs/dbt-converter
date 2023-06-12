{%- set cols = ['sales_segment','sales_l_0_region','sales_l_1_region','sales_functional_role','sales_minor_level'] -%}

with

source as (

    select * from {{source('fivetran_googlesheets', 'sales_attributes')}}
    where is_sales_attributes_included = true

),

cleaned as (

    select 

        job_id,

        {% for col in cols %}
            case
                when {{ col }} = 'nan'
                    then null
                else {{ col }}
            end as {{ col }} {%- if not loop.last %},{% endif %}
        {% endfor %}

    from source

)

select * from cleaned