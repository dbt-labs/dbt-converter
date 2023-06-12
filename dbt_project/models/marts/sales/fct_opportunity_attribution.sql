with

touchpoints as (

    select * exclude (opportunity_id) from {{ ref('fct_touchpoints') }}
    where account_id not in {{ internal_sfdc_accounts_list() }}

),

opportunities as (

    select * from {{ ref('fct_opportunities') }}
    where opportunity_type = 'Land'

),

joined as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'opportunities.opportunity_id',
            'touchpoints.touchpoint_id'
        ])}} as opportunity_touchpoint_id,
        touchpoints.*,
        opportunities.opportunity_id,
        opportunities.source_lead,
        opportunities.created_at as opportunity_created_at,
        opportunities.discover_at as opportunity_discovered_at,
        opportunities.stage_name as opportunity_stage_name,
        opportunities.delta_arr
    
    from touchpoints
    inner join opportunities
        on touchpoints.account_id = opportunities.account_id

),

parsed as (

    select
        *,

        case
            when data_source = 'Snowplow Sessions' and utm_medium = 'direct' then false
            when data_source = 'Snowplow Sessions' and utm_medium is null and utm_source is null and utm_campaign is null then false
            else true
        end as is_attributable,
        
        -- the below ensures that only touchpoints within 90 days of opportunity creation are considered
        -- note, we are using opened_at::date since we want to include the full day on the 90th day from creation
        case
            when opened_at::date >= dateadd('day',-90,opportunity_created_at)::date
                and opened_at <= opportunity_created_at
                    then true
            else false
        end as is_within_attribution_window,

        datediff(
            day,
            opened_at,
            opportunity_created_at
        ) as days_from_touchpoint_to_opportunity_creation,

        datediff(
            day,
            opened_at,
            opportunity_discovered_at
        ) as days_from_touchpoint_to_opportunity_discovered

    from joined
    where is_attributable = true
        and is_within_attribution_window = true

),

lead_creation_event as (

    select
        opportunity_touchpoint_id
    
    from parsed
    where data_source in ('Snowplow Conversions','Salesforce Touchpoints')
    qualify row_number() over (partition by opportunity_id order by opened_at)=1

),

attribution_stream_calcs as (

    select
        parsed.*,
        count(*) over (partition by opportunity_id) as count_of_opportunity_touchpoints,
        row_number() over (partition by opportunity_id order by opened_at) as opportunity_touchpoint_index,

        case
            when opportunity_touchpoint_index = 1 then true
            else false
        end as is_first_touch,

        case
            when parsed.opportunity_touchpoint_id = lead_creation_event.opportunity_touchpoint_id then true
            else false
        end as is_lead_creation_event,

        case
            when touchpoint_id = source_lead then true
            else false
        end as is_opportunity_creation_event

    from parsed
    left join lead_creation_event
        on parsed.opportunity_touchpoint_id = lead_creation_event.opportunity_touchpoint_id

),

attributable_event_calcs as (

    select
        opportunity_id,
        count(
            case
                when is_first_touch or is_lead_creation_event or is_opportunity_creation_event then touchpoint_id
            end) as count_of_key_attributable_touchpoints
        
    from attribution_stream_calcs
    group by 1

),

attribution_scoring_calcs as (

    select
        attribution_stream_calcs.*,

        count_of_key_attributable_touchpoints,

        case
            when count_of_key_attributable_touchpoints = 1
                and count_of_opportunity_touchpoints = 1
                then 1
            when count_of_key_attributable_touchpoints = 2
                and count_of_opportunity_touchpoints = 2
                then 0.5
            when count_of_key_attributable_touchpoints = 3
                and count_of_opportunity_touchpoints = 3
                then 1/3::double --using double for precision when aggregating fractional delta ARR
            when count_of_key_attributable_touchpoints >=3
                and (is_first_touch
                    or is_lead_creation_event
                    or is_opportunity_creation_event)
                then 0.3
            when count_of_key_attributable_touchpoints = 2
                and (is_first_touch
                    or is_lead_creation_event
                    or is_opportunity_creation_event)
                then 0.45
            when count_of_key_attributable_touchpoints = 1
                and (is_first_touch
                    or is_lead_creation_event
                    or is_opportunity_creation_event)
                then 0.9
            when not is_first_touch
                and not is_lead_creation_event
                and not is_opportunity_creation_event
                then 0.1 /
                    iff(
                        count_of_opportunity_touchpoints - count_of_key_attributable_touchpoints = 0,
                        1,
                        count_of_opportunity_touchpoints - count_of_key_attributable_touchpoints
                    )::double --using double for precision when aggregating fractional delta ARR
            else null
        end as touchpoint_credit_w_shape,

        1 / count_of_opportunity_touchpoints as touchpoint_credit_linear,

        case
            when opportunity_touchpoint_index = count_of_opportunity_touchpoints then 1
            else 0
        end as touchpoint_credit_last_touch,

        case
            when opportunity_touchpoint_index = 1 then 1
            else 0
        end as touchpoint_credit_first_touch

    from attribution_stream_calcs
    left join attributable_event_calcs using (opportunity_id)
    
),

final as (

    select
        -- identifiers
        opportunity_touchpoint_id,
        opportunity_id,
        touchpoint_id,
        external_touchpoint_id,
        account_id,
        contact_id,

        -- indices
        opportunity_touchpoint_index,

        -- touchpoint details
        touchpoint_name,
        touchpoint_source_detail,
        touchpoint_source_type,
        touchpoint_source,
        touchpoint_status,
        touchpoint_group,

        -- channel mapping details
        source_type,
        team,
        channel_grouping,
        channel,
        sub_channel,
        data_source,
        utm_medium,
        utm_source,
        utm_campaign,

        -- booleans
        is_attributable,
        is_within_attribution_window,
        is_first_touch,
        is_lead_creation_event,
        is_opportunity_creation_event,
        is_deleted,

        -- timestamps
        opened_at,
        opportunity_created_at,
        opportunity_discovered_at,

        -- durations
        days_from_touchpoint_to_opportunity_creation,
        days_from_touchpoint_to_opportunity_discovered,

        -- measures
        delta_arr,
        count_of_opportunity_touchpoints,
        count_of_key_attributable_touchpoints,
        touchpoint_credit_w_shape,
        touchpoint_credit_w_shape * 100 as touchpoint_credit_w_shape_pct,
        touchpoint_credit_linear,
        touchpoint_credit_linear * 100 as touchpoint_credit_linear_pct,
        touchpoint_credit_last_touch,
        touchpoint_credit_last_touch as touchpoint_credit_last_touch_pct,
        touchpoint_credit_first_touch,
        touchpoint_credit_first_touch as touchpoint_credit_first_touch_pct,
        delta_arr * touchpoint_credit_w_shape as attributed_delta_arr_w_shape,
        delta_arr * touchpoint_credit_linear as attributed_delta_arr_linear,
        delta_arr * touchpoint_credit_last_touch as attributed_delta_arr_last_touch,
        delta_arr * touchpoint_credit_first_touch as attributed_delta_arr_first_touch

    from attribution_scoring_calcs

)

select * from final
