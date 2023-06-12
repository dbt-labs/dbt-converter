with source as (

    select * from {{ source('github', 'releases') }}

),

renamed as (

    select
        id,
        name,
        author:id::varchar as author_id,
        author:name::varchar as author_name,
        body,
        tag_name,
        draft,
        prerelease,
        published_at,
        created_at,
        url,
        html_url,
        _sdc_repository as repository

    from source

)

select * from renamed