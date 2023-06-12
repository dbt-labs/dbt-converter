with

intercom_conversations as (

    select * from {{ ref('stg_intercom_conversations') }}

),

intercom_users as (

    select * from {{ ref('stg_intercom_users') }}
    where is_fishtown_user = 0
),

intercom_companies as (

    select * from {{ ref('stg_intercom_companies') }}

),

users_flattened as (

    select 
    
        submitter_id,
        value:id::text as organization_id,
        user_name as submitter_name, 
        email,
        city_name, 
        country_name,
        count_associated_cloud_accounts,
        is_account_creator
  
    from intercom_users, 
    lateral flatten(input=>companies:data)

),

user_companies as (

    select 
    
        users_flattened.*,
        intercom_companies.company_name as organization_name,
        intercom_companies.cloud_account_id,
        
        row_number() over ( partition by submitter_id
            order by company_session_count desc) as session_rank -- rank the companies in order of dbt Cloud sessions

    from users_flattened

    left join intercom_companies 
        on users_flattened.organization_id = intercom_companies.company_id
    qualify session_rank = 1  -- associate the user strictly to the company with the most sessions

),

final as (

    select
        intercom_conversations.*,
        user_companies.organization_id,
        user_companies.cloud_account_id,
        user_companies.organization_name,
        user_companies.submitter_name

    from intercom_conversations
    left join user_companies using (submitter_id)

)

select * from final
