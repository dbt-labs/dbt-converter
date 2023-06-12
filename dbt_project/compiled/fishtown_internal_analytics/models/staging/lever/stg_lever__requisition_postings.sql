with

source as (

    select * from raw.fivetran_lever.requisition_posting

),

renamed as (

    select
        md5(cast(coalesce(cast(requisition_id as TEXT), '') || '-' || coalesce(cast(posting_id as TEXT), '') as TEXT)) as requisition_posting_id,
        requisition_id,
        posting_id

    from source

)

select * from renamed