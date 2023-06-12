
with source as (

    select * from {{ source('salesforce', 'user') }}

),

renamed as (

    select
        id as user_id,
        adp_associate_id__c as adp_associate_id,
        email,
        firstname as first_name,
        lastname as last_name,
        username,
        title,
        communitynickname as community_nickname,
        usertype as user_type,
        name,
        role_name__c as user_role,
        alias,
        managerid as manager_id,
        isactive as is_active,
        createddate as created_at
    from source

)

select * from renamed
