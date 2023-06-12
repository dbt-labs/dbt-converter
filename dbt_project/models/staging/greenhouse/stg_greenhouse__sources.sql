with

source as (

    select * from {{ source('greenhouse', 'source') }}

),

final as (

    select 

        id as source_id,
        name as source_name,
        source_type_name

    from source

)

select *
from final