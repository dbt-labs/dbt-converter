with

requisitions as (

    select * from {{ ref('base__lever_requisitions') }}
    where not _fivetran_deleted

),

users as (

    select * from {{ ref('stg_lever__users') }}

),

joined as (

    select
        requisitions.*,
        hiring_manager.user_name as hiring_manager_name,
        hiring_manager.email as hiring_manager_email,
        req_owner.user_name as owner_name,
        req_owner.email as owner_email,
        creator.user_name as creator_name,
        creator.email as creator_email
    from requisitions
    left join users as hiring_manager
        on requisitions.hiring_manager_id = hiring_manager.user_id
    left join users as req_owner
        on requisitions.owner_id = req_owner.user_id
    left join users as creator
        on requisitions.creator_id = creator.user_id

)

select * from joined