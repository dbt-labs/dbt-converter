with all_ticket_tags as (

    select * from {{ ref('fct_support_ticket_tags') }}

),

final as (
    select
        ticket_id,
        array_to_string(array_agg(distinct tag_name) within group (order by tag_name asc),', ') as all_ticket_tags,
        max(tag_name = 'enterprise') as is_enterprise_tagged,
        max(
            tag_name ilike 'tier%2%' 
            OR tag_name ilike '%support_engineering%'
            ) as is_tier_two_support,
        max(tag_name ilike 'automated') as is_automated,
        max(
            tag_name ilike 'setup'
            OR tag_name ilike 'setup_new'
            OR tag_name ilike 'setup_decommission'
            OR tag_name ilike 'setup_expand'
            ) as is_setup_related,
        max(
            tag_name ilike 'new_land_deal'
            OR tag_name ilike 'setup_new'
            ) as is_setup_land_related,
        max(tag_name ilike '%merge%') as is_merged,
        max(tag_name ilike '%proactive%') as is_proactive

    from all_ticket_tags
    group by 1
)

select * from final