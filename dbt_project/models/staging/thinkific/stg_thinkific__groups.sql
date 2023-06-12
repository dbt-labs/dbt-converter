with 

source as (

    select * from {{ source('thinkific', 'groups') }}

),

renamed as (

    select

        -- keys
        id as group_id,
        token as unique_identifier,

        -- description
        name as group_name,
        
        -- timestamps
        created_at::timestamp_ntz as created_at

    from source

)

select * from renamed