with base as (

    {{ dbt_utils.union_relations(
        relations=[
            source('quickbooks', 'customers'),
            source('quickbooks_inc', 'customers')]
    ) }}

),

quickbooks_customer_id_map as (

    select * from {{ref('stg_quickbooks__customer_id_map')}}

),

parsed as (

    select

        {{ dbt_utils.generate_surrogate_key([
            "split_part(_dbt_source_relation,'.',2)",
            'id']) }}
            as quickbooks_customer_id,

        case split_part(_dbt_source_relation,'.',2)
            when 'quickbooks' then 'llc'
            when 'quickbooks_inc' then 'inc'
            else 'error'
        end as quickbooks_account,
        id as internal_id,
        companyname as company_name,
        displayname as display_name,
        active,
        balance,
        metadata['createtime']::timestamp as created_at,
        metadata['lastupdatedtime']::timestamp as updated_at

    from base

),

mapped as (

    select

        -- this customer stitching functionality handles cross-account
        -- identification for customers. more info can be found in the
        -- documentation for stg_customer_id_map.

        coalesce(
            quickbooks_customer_id_map.customer_id_map_to::varchar,
            quickbooks_customer_id::varchar
            ) as quickbooks_customer_id,
        quickbooks_customer_id as original_quickbooks_customer_id,

        quickbooks_account,
        internal_id,
        company_name,
        display_name,
        active,
        balance,
        created_at,
        updated_at

    from parsed

    left join quickbooks_customer_id_map
        on parsed.quickbooks_customer_id::varchar =
            quickbooks_customer_id_map.customer_id_map_from::varchar

)

select * from mapped
