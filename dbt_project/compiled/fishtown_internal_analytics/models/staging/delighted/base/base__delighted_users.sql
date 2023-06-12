with

source as (

    --this unions delighted projects together. when you add to this, update
    --the delighted_source_categorization macro to categorize correctly!

    

        (
            select
                cast('raw.fivetran_delighted.person' as TEXT) as feedback_source,

                

            from raw.fivetran_delighted.person

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_delighted_zendesk_csat.person' as TEXT) as feedback_source,

                

            from raw.fivetran_delighted_zendesk_csat.person

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_delighted_thinkific_nps.person' as TEXT) as feedback_source,

                

            from raw.fivetran_delighted_thinkific_nps.person

            
        )

        union all
        

        (
            select
                cast('raw.fivetran_delighted_proserv_csat.person' as TEXT) as feedback_source,

                

            from raw.fivetran_delighted_proserv_csat.person

            
        )

        

),

renamed as (

    select
    
        id as delighted_user_id,

        
    case
        when feedback_source ilike 'raw.fivetran_delighted_zendesk_csat%'
            then 'zendesk_csat'
        when feedback_source ilike 'raw.fivetran_delighted_thinkific_nps%'
            then 'thinkific_nps'
        when feedback_source ilike 'raw.fivetran_delighted_proserv_csat%' 
            then 'proserv_csat'
        when feedback_source ilike 'raw.fivetran_delighted%' 
            then 'dbt_cloud_nps'
    end as feedback_source,


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