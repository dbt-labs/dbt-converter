with 

organizations as (

    select * from {{ ref('int__organizations_smoothed') }}

),

cloud_accounts as (
    
    select * from {{ ref('fct_cloud_accounts') }}

),
--[TODO / TECH DEBT]: See if we can change this loop to be more dynamic
--(https://app.asana.com/0/1200281450694261/1203006173021925/f)
-- This CTE and the following loop attach accounts from their immediate organization up through all
-- parent organizations to enable aggregation at each parent organization level.
-- The full join here populates orgs WITHOUT cloud accounts

organizations_ancestry_level_0 as (

    select
        cloud_accounts.account_id,
        coalesce(
            cloud_accounts.organization_id,
            organizations.organization_id
        ) as organization_id,
        coalesce(
            cloud_accounts.organization_id,
            organizations.organization_id
        ) as ancestor_organization_id,
        0 as ancestry_levels

    from cloud_accounts
    full join organizations
        on cloud_accounts.organization_id = organizations.organization_id
    
),

-- since baseline organization table starts with 1 level of child/parent, this loop proceses levels 2+
-- update max_counter if complexity of organizational hierarchy ever exceeds 5 levels
{% set max_counter = 5 %}
{% set counter = 1 %}

{% for counter in range(1, max_counter+1) %}

organizations_ancestry_level_{{counter}} as (

    select
        current_level.account_id,
        current_level.organization_id,
        next_level.parent_organization_id as ancestor_organization_id,
        {{counter}} as ancestry_levels

    from organizations_ancestry_level_{{counter-1}} as current_level
    left join organizations as next_level
        on current_level.ancestor_organization_id = next_level.organization_id
    where next_level.parent_organization_id is not null

),

mapping_union_through_level_{{counter}} as (

    select * from organizations_ancestry_level_{{counter}}

    union all 

  {% if counter == 1 %}

    select * from organizations_ancestry_level_0

  {% elif loop.index <= max_counter %}  

    select * from mapping_union_through_level_{{counter-1}}

   {% endif %}    

),

{% endfor %}

organizations_aggregated_from_children as (

    select
        ancestry_mapping.ancestor_organization_id as organization_id,
        count(distinct 
            case
                when ancestry_levels != 0
                    then ancestry_mapping.organization_id
                end        
        ) as count_children,
       array_agg(distinct 
            case
                when ancestry_levels != 0
                    then ancestry_mapping.organization_id
                end        
        ) as list_children,
        count(distinct
            case
                when ancestry_levels = 0
                    then account_id
                end
        ) as count_cloud_accounts_excluding_children,
        array_agg(distinct
            case
                when ancestry_levels = 0
                    then account_id
                end
        ) as list_cloud_accounts_excluding_children,
        count(distinct ancestry_mapping.account_id) as count_cloud_accounts_including_all_children,
        array_agg(distinct ancestry_mapping.account_id) as list_cloud_accounts_including_all_children
        
    from mapping_union_through_level_{{max_counter}} ancestry_mapping
    group by 1

)

select * from organizations_aggregated_from_children