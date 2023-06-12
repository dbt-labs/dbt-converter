with source as (

    select * from raw.fivetran_googlesheets.singletenant_ips

),

renamed as (

    select
        masked,
        ip,
        deployment,
        url_host,
        database_schema,
        regexp_replace(database_schema, 'fivetran_st_|_public', '') as database_source,

        'single-tenant' as database_type,

        _fivetran_synced

    from source

)

select * from renamed