with

source as (

    select * from {{ source('jira', 'status_category') }}

),

renamed as (

    select 
        id as status_category_id,
        name as status_category_name

    from source

)

select * from renamed