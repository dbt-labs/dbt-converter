with source as (

    select * from raw.fivetran_lever.archive_reason

),

archive_reason as (

    select
        id as archive_reason_id,
        text as archive_reason

    from source

)

select * from archive_reason