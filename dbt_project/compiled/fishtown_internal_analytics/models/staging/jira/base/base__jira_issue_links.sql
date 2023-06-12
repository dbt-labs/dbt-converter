with

source as (

    select * from raw.fivetran_jira.issue_link

),

renamed as (
    
    select 
        md5(cast(coalesce(cast(issue_id as TEXT), '') || '-' || coalesce(cast(related_issue_id as TEXT), '') as TEXT)) as issue_link_id,
        issue_id,
        related_issue_id,
        listagg(relationship, ', ') within group (
            order by relationship
        ) as related_issue_relationships
        --we listagg this because a single issue can have multiple relationships
        --to another issue. we only care about linking related issues and then
        --seeing what relationships are included.
        --if we foresee that we need to specify relationships in the reporting layer.
        --we will need:
        --1. To have a standardization of "relationships" nomenclature
        --2. We can have a separate model for issue_link_relationships

    from source
    group by 1,2,3

)

select * from renamed