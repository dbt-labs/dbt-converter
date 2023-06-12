with

source as (

    select * from {{ source('adp', 'organizational_unit') }}

),

renamed as (

    select
        id as organizational_unit_id,

        -- Conditional is a temp workaround for a Fivetran issue
        case
            when name = '501201'
                then 'Acquisition Growth Marketing'
            else coalesce(name_short_name, name_long_name)
        end as organizational_unit_name,
        type_short_name as organizational_level_name,
        name as cost_center_code

    from source

)

select * from renamed
