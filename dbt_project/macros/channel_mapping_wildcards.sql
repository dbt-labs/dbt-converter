{% macro channel_mapping_wildcards(medium_column, source_column, channel_column, sub_channel_column, team_column, source_type_column, channel_grouping_column)%}

{%- set channel_mapping_query -%}
        select
            channel,
            sub_channel,
            medium,
            source,
            team,
            source_type,
            channel_grouping

        from {{ ref('fct_notion_channel_mapping') }}
        where source = '*'
        order by 1,2,3,4
{%- endset -%}

{%- set results = run_query(channel_mapping_query) -%}

{%- if execute -%}

    {%- set channels = results.columns[0].values() -%}
    {%- set sub_channels = results.columns[1].values() -%}
    {%- set mediums = results.columns[2].values() -%}
    {%- set teams = results.columns[4].values() -%}
    {%- set source_types = results.columns[5].values() -%}
    {%- set channel_groupings = results.columns[6].values() -%}

        case
            when {{ source_column }} is not null
                and {{ medium_column }} is null
                then 'Referral'
        {%- for channel in channels %}
            when {{ medium_column }} = '{{ mediums[loop.index0] }}'
                and {{ channel_column }} is null
                then '{{ channel }}'
        {%- endfor %}
            else {{ channel_column }}
        end as channel,

        case
            when {{ source_column }} is not null
                and {{ medium_column }} is null
                then 'Other'
        {%- for channel in channels %}
            when {{ medium_column }} = '{{ mediums[loop.index0] }}'
                and {{ channel_column }} is null
                then '{{ sub_channels[loop.index0] }}'
        {%- endfor %}
            else {{ sub_channel_column }}
        end as sub_channel,

        case
            when {{ source_column }} is not null
                and {{ medium_column }} is null
                then 'Marketing'
        {%- for channel in channels %}
            when {{ medium_column }} = '{{ mediums[loop.index0] }}'
                and {{ channel_column }} is null
                then '{{ teams[loop.index0] }}'
        {%- endfor %}
            else {{ team_column }}
        end as team,

        case
            when {{ source_column }} is not null
                and {{ medium_column }} is null
                then 'Demand Generation'
        {%- for channel in channels %}
            when {{ medium_column }} = '{{ mediums[loop.index0] }}'
                and {{ channel_column }} is null
                then '{{ source_types[loop.index0] }}'
        {%- endfor %}
            else {{ source_type_column }}
        end as source_type,

        case
            when {{ source_column }} is not null
                and {{ medium_column }} is null
                then 'Inbound Free'
        {%- for channel in channels %}
            when {{ medium_column }} = '{{ mediums[loop.index0] }}'
                and {{ channel_column }} is null
                then '{{ channel_groupings[loop.index0] }}'
        {%- endfor %}
            else {{ channel_grouping_column }}
        end as channel_grouping

{%- endif -%}

{% endmacro %}