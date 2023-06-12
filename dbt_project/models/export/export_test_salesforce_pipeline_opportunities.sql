--This test ensures that any open pipeline opportunities match the below set fields

{% set accepted_market_segments = [
        "Commercial",
        "Enterprise"
        ] -%}

{% set accepted_regions = [
        "APAC",
        "EMEA",
        "US-Central",
        "US-East",
        "US-West"
        ] -%}

{% set accepted_lead_source_types = [
        "Alliances",
        "Marketing", 
        "SD Outbound", 
        "SDR Outbound"
        ] %}


with pipeline_opps as (

    select * from {{ ref('fct_opportunities') }}
    where furthest_pipeline_stage_achieved in ('Pipeline','Pre-Pipeline')
        and is_closed = False

),

opps_test as (

    select
        opportunity_id,
        opportunity_name,
        furthest_pipeline_stage_achieved,
        
        case
            when market_segment not in (
                {% for market_segment in accepted_market_segments -%}
                    '{{market_segment}}'
                    {{ "," if not loop.last }}
                {%- endfor -%}
            ) then 'Not in accepted values'
            else coalesce(market_segment,'Is missing')
        end as market_segment,

        case
            when region not in (
                {% for region in accepted_regions -%}
                '{{region}}'
                {{ "," if not loop.last }}
                {%- endfor -%}
            ) then 'Not in accepted values'
            else coalesce(region, 'Is missing')
        end as region,

        case
            when lead_source_type not in (
                {% for lead_source_type in accepted_lead_source_types -%}
                '{{lead_source_type}}'
                {{ "," if not loop.last }}
                {%- endfor -%}
            ) then 'Not in accepted values'
            else coalesce(lead_source_type, 'Is missing')
        end as lead_source_type,

        'https://fishtown.lightning.force.com/lightning/r/Opportunity/' || opportunity_id || '/view' as url

    from pipeline_opps
        
),

final as (

    select * from opps_test
    where
    market_segment not in (
        {% for market_segment in accepted_market_segments -%}
        '{{market_segment}}'
        {{ "," if not loop.last }}
        {%- endfor -%}
    )

    or region not in (
        {% for region in accepted_regions -%}
        '{{region}}'
        {{ "," if not loop.last }}
        {%- endfor -%}
    )
    
    or lead_source_type not in (
        {% for lead_source_type in accepted_lead_source_types -%}
        '{{lead_source_type}}'
        {{ "," if not loop.last }}
        {%- endfor -%}
    )
)

select * from final