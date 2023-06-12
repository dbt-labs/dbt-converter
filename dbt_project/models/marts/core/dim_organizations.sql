with

organizations as (

    select * from {{ ref('int__organizations_smoothed') }}

),

organizations_aggregated as (

    select * from {{ ref('int__organizations_aggregated') }}

),

final as (

    select 
        organizations.*,
        coalesce(count_children,0) as count_children,
        list_children,
        coalesce(count_cloud_accounts_excluding_children,0) as count_cloud_accounts_excluding_children,
        list_cloud_accounts_excluding_children,
        coalesce(count_cloud_accounts_including_all_children,0) as count_cloud_accounts_including_all_children,
        list_cloud_accounts_including_all_children
        
    from organizations
    left join organizations_aggregated using (organization_id)

)

select * from final