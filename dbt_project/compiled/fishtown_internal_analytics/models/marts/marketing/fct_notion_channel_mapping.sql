

with

    source as (

        select * from analytics_dev.dbt_jstein.stg_notion__databases
        where notion_database_id = '92d27ce5-8d5e-4c08-b350-10bbdf6d071e'
            and is_deleted = False

    ),

    unpack_json as (

        select
            notion_database_id,
            notion_database_row_id,flatten_medium.value:name::string

                

                as medium,

            flatten_source.value:name::string

                

                as source,

            

                    notion_database_row:"Event Name":select:name::string

                as event_name,

            

                    notion_database_row:"Source Type":select:name::string

                as source_type,

            

                    notion_database_row:"Additional Context":title[0]:plain_text::string

                as additional_context,

            

                    notion_database_row:"Campaign":select:name::string

                as campaign,

            flatten_team.value:name::string

                

                as team,

            

                    notion_database_row:"Channel":select:name::string

                as channel,

            

                    notion_database_row:"Referred by Partner":select:name::string

                as referred_by_partner,

            

                    notion_database_row:"Sub Channel":select:name::string

                as sub_channel,

            

                    notion_database_row:"Channel Grouping":select:name::string

                as channel_grouping

            from source, lateral flatten (input => notion_database_row:"Medium":multi_select, outer => true) flatten_medium

        , lateral flatten (input => notion_database_row:"Source":multi_select, outer => true) flatten_source

        , lateral flatten (input => notion_database_row:"Team":multi_select, outer => true) flatten_team

        ),

final as (

    select
        
    
md5(cast(coalesce(cast(channel as TEXT), '') || '-' || coalesce(cast(sub_channel as TEXT), '') || '-' || coalesce(cast(source as TEXT), '') || '-' || coalesce(cast(medium as TEXT), '') || '-' || coalesce(cast(event_name as TEXT), '') || '-' || coalesce(cast(referred_by_partner as TEXT), '') as TEXT)) as unique_id,

        -- the below surrogate key is used to map unique combinations of source/medium to other web & attribution datasets
        
    
md5(cast(coalesce(cast(source as TEXT), '') || '-' || coalesce(cast(medium as TEXT), '') as TEXT)) as source_mapping_id,
        
        -- the below surrogate key is used to map unique combinations of events and sources for touchpoint enrichment
        
    
md5(cast(coalesce(cast(source as TEXT), '') || '-' || coalesce(cast(event_name as TEXT), '') as TEXT)) as touchpoint_mapping_id,
        *

    from unpack_json

)

select * from final