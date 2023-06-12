
    
    

with all_values as (

    select
        type as value_field,
        count(*) as n_records

    from raw.slack.messages
    group by type

)

select *
from all_values
where value_field not in (
    'message'
)


