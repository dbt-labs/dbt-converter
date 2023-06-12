with

 reqs as (

    select * from {{ ref('stg_lever__requisitions') }}

),

enhanced as (
  select
    *,
    row_number() over(partition by requisition_code order by created_at desc) as seat_occurrence
  from reqs

)


select * from enhanced