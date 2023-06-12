with

source as (

    select *from {{ source('greenhouse', 'office') }}
    where _fivetran_deleted = false

),

synth as (

    select 
        id as office_id,
        name as office_name,

        case
            when name like any ('US%','%Philadelphia%')
                then 'United States'
            when name like any ('%UK%','%EMEA%')
                then 'United Kingdom'
            when name like any ('%DACH%','%Germany%')
                then 'Germany'
            when name like any ('%APAC%','%AUS%')
                then 'Australia'
            when name like 'Ire%'
                then 'Ireland'
            when name like '%Sweden%'
                then 'Sweden'
            when name = 'Nordics - Finland'
                then 'Finland'
            when name = 'Philippines - Remote'
                then 'Philippines'
            when name = 'CA - Distributed - Remote'
                then 'Canada'
            when name = 'Migration Office'
                then 'Ignore'
            else 'Unmapped'
        end as location_country

    from source

)

select * from synth