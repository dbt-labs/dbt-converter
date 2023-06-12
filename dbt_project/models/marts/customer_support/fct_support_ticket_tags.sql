with

intercom_tags as (

    select * from {{ ref('stg_intercom_conversation_tags') }}

),

zendesk_tags as (

    select * from {{ ref('stg_zendesk__ticket_tag') }}

),

intercom_to_union as (

    select
        'intercom' as source,
        ticket_id,
        tag_name,
        null as tag_category,
        null as tag_subcategory

    from intercom_tags

),

zendesk_to_union as (

    select
        'zendesk' as source,
        ticket_id,
        tags as tag_name,
        case
            when tags like '%-%'
                then split_part(tags, '-', 1) 
            else null
        end as tag_category,
        case
            when tags like '%-%'
                then split_part(tags, '-', 2)
            else null
        end as tag_subcategory

    from {{ ref('stg_zendesk__ticket_tag') }}

),

unioned as (

    select * from intercom_to_union
    union all
    select * from zendesk_to_union
)

select * from unioned
