with

contacts as (

    select * from {{ ref('stg_salesforce__contacts') }} 
    where is_deleted = false

),

accounts as (

    select * from {{ ref('stg_salesforce__accounts') }}

),

owners as (

    select * from {{ ref('stg_salesforce__owners') }}

),

touchpoints as (

    select * from {{ ref('stg_salesforce__touchpoints') }} 
    where is_deleted = false

),

contact_account_index as (

    select
        contact_id,
        row_number() over (
            partition by account_id 
            order by contact_created_at
        ) as contact_in_account_index    
    from contacts
    where account_id is not null

),

personas as (
    select
        contacts.*,
        case
            -- dbt Buyer Persona
            -- The Curious Outsider
            when
                contacts.title ilike any (
                    '%investor%',
                    '%journalist%',
                    '%industry analyst%',
                    '%partner%manager%'
                )
                then 'Curious Outsider'
            -- The Periphery Influencer
            when
                contacts.title ilike any (
                    '%it admin%',
                    '%platform%architect%',
                    '%data%architect%',
                    '%app%architect%',
                    '%analytics%architect%',
                    '%information security%',
                    '%infosec%',
                    '%data product manager%',
                    '%principal%',
                    '%architect%',
                    '%product manage%',
                    '%product%',
                    '%program%'
                )
                then 'Periphery Influencer'
            -- The Executive Influencer
            when len(contacts.title) = 3 
                and startswith(lower(contacts.title), 'c')
                then 'Executive Influencer'
            when len(contacts.title) = 4 
                and startswith(lower(contacts.title), 'c')
                then 'Executive Influencer'
            when
                contacts.title ilike '%exec%'
                and not contacts.title ilike '%account executive%'
                then 'Executive Influencer'
            when
                contacts.title ilike '%cto%'
                and not contacts.title ilike '%director%'
                then 'Executive Influencer'
            when
                contacts.title ilike any (
                    '%founder%',
                    '%president%',
                    '%partner%',
                    '%managing%',
                    '%chief%',
                    'owner',
                    '%board%',
                    '%cio%',
                    '%cdao%',
                    '%cao%',
                    '%cpo%',
                    '%svp%'
                )
                then 'Executive Influencer'
            -- Manager/Lead/Mentor
            when
                contacts.title ilike any (
                    '%vp%analytics%',
                    '%vp%data%',
                    '%vp%bi%',
                    '%vp%',
                    '%vp%engineering%',
                    '%vp%business%intel%',
                    '%vice president%analytics%',
                    '%vice president%data%',
                    '%vice president%bi%',
                    '%vice president%business%intel%',
                    '%head%data%',
                    '%head%analytics%',
                    '%head of data%',
                    '%head of analytics%',
                    '%head of business intelligence%',
                    '%head of bi%',
                    '%head of %',
                    '%manager%data%',
                    '%data%manager%',
                    '%manager%analytics%',
                    '%analytics%manager%',
                    '%manager of data%',
                    '%manager of analytics%',
                    '%data%lead%',
                    '%analytics%lead%',
                    '%lead%data%',
                    '%lead%analytics%',
                    '%director%data%',
                    '%director%analytics%',
                    '%director%bi%',
                    '%director%engineering%',
                    '%engineering manager%',
                    '%engineering director%',
                    '%head of engineering%',
                    '%principal%engineer%',
                    '%engineering lead%',
                    '%team lead%data%',
                    '%team lead%analytics%',
                    '%team lead%engineer%',
                    '%team lead%bi%',
                    '%bi%team lead%',
                    '%business intelligence%team lead%',
                    '%business intelligence%manage%',
                    '%bi%lead%',
                    '%bi%manage%',
                    '%manage%bi%',
                    '%manage%business%',
                    '%analytics%team lead%',
                    '%data%team lead%',
                    '%director%'
                )
                then 'Manager/Lead/Mentor'
            -- Knowledge Analyzer
            when
                contacts.title ilike any (
                    '%data%analyst%',
                    '%analytics%consultant%',
                    '%business%analyst%',
                    '%bi analyst%',
                    '%business intelligence analyst%',
                    '%business intelligence consultant%',
                    '%bi engineer%',
                    '%business intelligence engineer%',
                    '%bi%analytics%',
                    '%consult%',
                    '%analyst%'
                )
                then 'Knowledge Analyzer'
            -- Knowledge Builder
            when
                contacts.title ilike any (
                    '%data engineer%',
                    '%analytics engineer%',
                    '%data scientist%',
                    '%software engineer%',
                    '%engineer%'
                )
                then 'Knowledge Builder'
            -- catch all
            when contacts.title is not null
                then 'Other'
            else null
        end as persona
    from contacts
    left join accounts 
        on contacts.account_id = accounts.account_id
),

joined as (
    select
        personas.*,
        owners.owner_name as sdr_name,
        contact_account_index.contact_in_account_index,
        -- touchpoints
        touchpoints.touchpoint_source as qualified_touchpoint_source,
        touchpoints.touchpoint_source_type as qualified_touchpoint_source_type,
        touchpoints.touchpoint_source_detail as qualified_touchpoint_source_detail,
        case
            when personas.qualified_at is not null 
                then true 
            else false
        end as is_qualified
    from personas
    left join contact_account_index 
        on personas.contact_id = contact_account_index.contact_id
    left join owners 
        on personas.sdr_id = owners.owner_id
    left join touchpoints 
        on personas.qualified_touchpoint_id = touchpoints.touchpoint_id
)

select *
from joined