{%- test unique_combination_of_column_values(model, group_by, count_by) -%}

with

fields as (

    select distinct
        {{ group_by }},
        {{ count_by }}
    
    from {{ model }}

),

validation_errors as (

    select
        {{ group_by }},
        count(*)       

    from fields
    group by 1
    having count(*) > 1

)

select * from validation_errors

{%- endtest -%}