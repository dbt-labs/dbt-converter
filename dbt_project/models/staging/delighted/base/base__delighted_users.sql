with

source as (

    --this unions delighted projects together. when you add to this, update
    --the delighted_source_categorization macro to categorize correctly!

    {{ dbt_utils.union_relations(
        relations=[
            source('delighted_dbtcloud_nps', 'person'), 
            source('delighted_zendesk_csat', 'person'),
            source('delighted_thinkific_nps', 'person'),
            source('delighted_proserv_csat', 'person')
        ],
        source_column_name="feedback_source"
    ) }}

),

renamed as (

    select
    
        id as delighted_user_id,

        {{ delighted_source_categorization() }}

        --available for all delighted people
        name,
        email,
        properties_delighted_source as survey_source,
        properties_delighted_device_type as device_type,
        properties_delighted_browser as browser,
        properties_delighted_operating_system as operating_system,

        created_at::timestamp_tz as user_created_at

    from source

)

select * from renamed
