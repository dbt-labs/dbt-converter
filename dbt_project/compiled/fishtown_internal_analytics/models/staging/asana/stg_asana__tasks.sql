

with

source as (

    select * from raw.fivetran_asana_boards.task
    

),

renamed as (

    select
        id as task_id,
        parent_id as parent_task_id,
        workspace_id,
        assignee_id,
        completed_by_id,

        name as task_name,
        resource_subtype as task_type,
        notes as task_notes,
        custom_department as department,
        custom_est_hours as est_hours,
        --custom_request_type as request_type,
        --custom_labels as labels,
        --custom_attachment_links as attachment_links,

        --custom_blocker as blocker,
        custom_priority as priority,
        --custom_pull_request as pull_request,
        --custom_board_name as board_name,
        --custom_members as members,
        --custom_monthly_hours as monthly_hours,
        custom_engagement_type as engagement_type,
        custom_account_id as salesforce_account_id, 
        custom_opportunity_product_id as salesforce_opportunity_line_item_id,

        as_boolean(completed) as is_task_completed,
        liked as is_liked,

        _fivetran_deleted as is_deleted,

        --num_hearts,
        num_likes,
        custom_cost as cost,

        --custom_card_url as proserve_card_url,
        --custom_sprint as proserve_sprint,
        --custom_due_date_imported_ as proserve_due_date_imported,
        custom_start_date as proserve_scheduling_notes,
        --custom_last_activity_date as proserve_last_activity_date,
        --custom_archived as proserve_archived,
        custom_ps_engagement_type as proserve_engagement_type,

        custom_cutover as st_migration_cutover_at,
        modified_at,
        created_at,
        start_on,
        due_on::date as due_on,
        completed_at::date as completed_at,
        get(parse_json(custom_delivered_by),0)::string as delivered_by_1_id,
        get(parse_json(custom_delivered_by),1)::string as delivered_by_2_id,
        get(parse_json(custom_delivered_by),2)::string as delivered_by_3_id,
        custom_monthly_hours as ps_monthly_hours

    from source

)

select * from renamed