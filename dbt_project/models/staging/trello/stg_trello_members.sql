with source as (

    select * from {{source('trello', 'users')}}

),

renamed as (

    select distinct
        id as member_id,
        username,
        case
            when fullname = 'eovaughan' then 'Erin Vaughan'
            when fullname = 'thomaskavukat2' then 'Thomas Kavukat'
            when username = 'christinemberger' then 'Christine Berger'
            when username = 'aescay' then 'Andrew Escay'
            when username = 'connormcarthur1' then 'Connor McArthur'
            else fullname
            end as name
    from source

)

select * from renamed
