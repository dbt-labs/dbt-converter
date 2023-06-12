with source as (

    select * from {{ source('salesforce', 'quarters') }}

),

-- The below logic is used to identify the quarter id of the last quarter
previous_quarter as (

    select
    
        last_quarter__c as last_quarter_id
    
    from source
    where current_quarter__c = true

),

renamed as (

    select
        id as quarter_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        last_quarter__c as last_quarter_id,
        next_quarter__c as next_quarter_id,
        ownerid as owner_id,
        
        name as quarter_name,
        current_quarter__c as is_current_quarter,

        coalesce(id = previous_quarter.last_quarter_id, false) as is_previous_quarter,

        isdeleted as is_deleted,
        start_date__c as start_date,
        end_date__c as end_date,
        createddate as created_date,
        lastmodifieddate as last_modified_date,
        systemmodstamp as system_modstamp

    from source
    left join previous_quarter
        on source.id = previous_quarter.last_quarter_id

)

select * from renamed