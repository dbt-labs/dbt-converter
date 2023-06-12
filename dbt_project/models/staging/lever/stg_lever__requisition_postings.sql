with

source as (

    select * from {{ source('lever', 'requisition_posting') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'requisition_id',
            'posting_id'
        ])}} as requisition_posting_id,
        requisition_id,
        posting_id

    from source

)

select * from renamed