with source as (

    select * from raw.salesforce.user

),

renamed as (

    select
    
        id as owner_id,
        name as owner_name,
        firstname as owner_first_name,
        lastname as owner_last_name, 
        email,
        username,
        title,
        usertype as user_type,
        communitynickname as community_nickname,
        role_name__c as role_name,

        case
            when role_name = 'Sales Director' then 'SD'
            when role_name = 'Regional Director of Sales' then 'SD'
            when role_name = 'Sales Development Rep' then 'SDR'
            when role_name = 'Solutions Architect' then 'SA'
            when role_name = 'Regional Director of Solutions Architecture' then 'SA'
            when role_name = 'Head of Solutions Architecture' then 'SA'
        end as owner_role_grouping,
        
        _sdc_batched_at,
        _sdc_extracted_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed