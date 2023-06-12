{# Segment customer NPS responses into three groups (promoters, passives, detractors) 
according to their numerical response to the 0–10 rating question. #}

{%- macro segment_nps_score(score) -%}

    case
        when {{ score }} < 7 then 'detractor'
        when {{ score }} between 7 and 8 then 'passive'
        when {{ score }} > 8 then 'promoter'
    end

{%- endmacro -%}