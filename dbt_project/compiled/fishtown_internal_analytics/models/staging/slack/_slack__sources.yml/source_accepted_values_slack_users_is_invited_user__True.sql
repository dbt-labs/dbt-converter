
    
    

with all_values as (

    select
        is_invited_user as value_field,
        count(*) as n_records

    from raw.slack.users
    group by is_invited_user

)

select *
from all_values
where value_field not in (
    'True'
)


