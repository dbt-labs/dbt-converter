with

source as (

    select * from {{ source('salesforce', 'campaign') }}

),

renamed as (

    select
        id as campaign_id,
        ownerid as owner_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        parentid as parent_id,
        coalesce(parentid, id) as parent_campaign_mapping_id,

        name as campaign_name,
        status as campaign_status,
        type as campaign_type,

        isactive as is_active,
        isdeleted as is_deleted,
        include_in_attribution__c as is_attributable,

        amountallopportunities as amount_all_opportunities,
        amountwonopportunities as amount_won_opportunities,
        expectedresponse as expected_response,
        numberofcontacts as number_of_contacts,
        numberofconvertedleads as number_of_converted_leads,
        numberofleads as number_of_leads,
        numberofopportunities as number_of_opportunities,
        numberofresponses as number_of_responses,
        numberofwonopportunities as number_of_won_opportunities,
        numbersent as number_sent,
        actualcost as actual_cost,

        lastmodifieddate as last_modified_date,
        systemmodstamp as system_modstamp,
        lastreferenceddate as last_referenced_date,
        lastvieweddate as last_viewed_date,
        createddate as campaign_created_date,
        startdate as campaign_start_date,
        enddate as campaign_end_date

    from source

),

-- the below CTEs are required to map a campaign to their parent campaign. it also maps the parent campaign (of an already parent campaign) as itself.
parent_campaigns_filtered as (

    select
        parent_campaign_mapping_id

    from renamed
    where parent_campaign_mapping_id is not null
    group by 1

),

parent_campaigns_enriched as (

    select
        campaign_id as parent_campaign_id,
        campaign_name as parent_campaign_name
    
    from renamed
    inner join parent_campaigns_filtered
        on renamed.campaign_id = parent_campaigns_filtered.parent_campaign_mapping_id
  
),

joined as (

    select
        renamed.*,
        
        case
            when parent_campaign_mapping_id = parent_campaign_id then parent_campaign_name
        end as parent_campaign_name,
  
        case
            when parent_campaign_mapping_id = parent_campaign_id then parent_campaign_id
        end as parent_campaign_id,

        case
            when parent_id is not null then true
            else false
        end as has_parent_campaign,
        
        coalesce(campaign_id = parent_campaign_id, false) as is_parent_campaign
    
    from renamed
    left join parent_campaigns_enriched
        on renamed.parent_campaign_mapping_id = parent_campaigns_enriched.parent_campaign_id

)

select * from joined