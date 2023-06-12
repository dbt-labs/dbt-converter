with

delivery as (
    
    select * from {{ ref('fct_services_delivery') }}
    
),

unioned as (
    
    select delivered_by_1_name as name from delivery

    union 

    select delivered_by_2_name as name from delivery

    union

    select delivered_by_3_name as name from delivery
    
)

select * from unioned
where name not ilike '%@%'
