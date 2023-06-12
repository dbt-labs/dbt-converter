

with

source as (

    select * from raw.fivetran_googlesheets.incidentio_incidents

),

renamed as (

    select
        id as incident_id,
        name as incident_name,
        status as incident_status,
        reporter,
        severity,
        communication_lead,
        incident_lead,
        case
            when impacted_team = 'Infra'
                then 'Infrastructure'
            else impacted_team
        end as impacted_team,

        summary as incident_summary,
        post_mortem_document,

        how_was_this_incident_detected_ as how_was_this_incident_detected,
        which_team_triggered_this_incident_ as which_team_triggered_this_incident,
        which_severity_was_set_in_statuspage_ as which_severity_was_set_in_statuspage,
        escalate_immediately_ as escalated_immediately,

        duration_seconds_ as duration_seconds,

        datediff(
            minute,
            reported_at,
            coalesce(fixed_at, closed_at)
        ) as time_to_resolution,

        (created_month ||'-01')::date as created_month,
        created_at,
        updated_at,
        reported_at,
        identified_at,
        fixed_at,
        to_timestamp(closed_at) as closed_at

    from source

)

select * from renamed