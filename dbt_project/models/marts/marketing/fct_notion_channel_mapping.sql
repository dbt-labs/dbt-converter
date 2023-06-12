{{ unpack_notion_databases('92d27ce5-8d5e-4c08-b350-10bbdf6d071e')}}

cleaned as (

    select
        * exclude (medium, source),

        -- in order to include null values in our channel map in Notion, we have to force the 'null' string
        -- this converts that string into a proper null value
        nullif(medium, 'null') as medium,

        nullif(source, 'null') as source
    
    from unpack_json

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'channel',
            'sub_channel',
            'source',
            'medium',
            'event_name',
            'referred_by_partner'
        ]) }} as unique_id,

        -- the below surrogate key is used to map unique combinations of source/medium to other web & attribution datasets
        {{ dbt_utils.generate_surrogate_key([
            'source',
            'medium'
        ]) }} as source_mapping_id,
        
        -- the below surrogate key is used to map unique combinations of events and sources for touchpoint enrichment
        {{ dbt_utils.generate_surrogate_key([
            'source',
            'event_name'
        ]) }} as touchpoint_mapping_id,
        *,

        case
            when event_name is null
                or (medium is not null and source is not null)
                then true
            else false
        end as is_web_mapping

    from cleaned

)

select * from final