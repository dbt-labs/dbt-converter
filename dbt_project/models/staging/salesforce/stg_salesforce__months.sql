with source as (

    select * from {{ source('salesforce', 'months') }}

),

-- The below logic is used to identify the month id of the previous month
previous_month as (

    select
        last_month__c as last_month_id
    
    from source
    where current_month__c = true

),

renamed as (

    select
        id as month_id,
        quarter__c as quarter_id,
        createdbyid as created_by_id,
        lastmodifiedbyid as last_modified_by_id,
        
        name as month_name,
        
        current_month__c as is_current_month,
        coalesce(id = previous_month.last_month_id, false) as is_previous_month,
        isdeleted as is_deleted,

        createddate as created_at,
        lastmodifieddate as last_modified_at,
        start_date__c as start_date,
        end_date__c as end_date,
        systemmodstamp as system_modstamp

    from source
    left join previous_month
        on source.id = previous_month.last_month_id

)

select * from renamed