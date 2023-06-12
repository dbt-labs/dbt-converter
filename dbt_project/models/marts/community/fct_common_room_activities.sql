with

source as (
-- performs deduplication by only grabbing the first occurence of a duplicate row 

    select * from {{ ref('stg_common_room__activities') }}
    where number_of_occurrences = 1

),

final as (
-- then dropping the number_of_occurrences column

    select
        {{ dbt_utils.star(
            from=ref('stg_common_room__activities'),
            except=["number_of_occurrences"])
        }}
    from source
    
)

select * from final