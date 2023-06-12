with

snapshot as (

    select * from {{ ref('notion_security_questionnaire_snapshot') }}

),

unpacked as (

    select
        id as security_questionnaire_id,

        properties:"Status":select:name::string as status,
        dbt_valid_from,
        dbt_valid_to
    
    from snapshot

),

pivoted as (

    select
        security_questionnaire_id,

        {%- for status in ['Not started', 'In progress', 'On Hold', 'Completed'] %}

            min(
                case
                    when status = '{{ status }}'
                        then dbt_valid_from
                    else null
                end
            ) as first_{{  dbt_utils.slugify(status) }}_status_at{% if not loop.last %},{% endif %}

        {% endfor -%}
    
    from unpacked
    group by 1

),

final as (

    select
        security_questionnaire_id,
        {{ datediff('first_not_started_status_at', 'first_completed_status_at', 'hour') }} as hours_to_completed_status

    from pivoted

)

select * from final