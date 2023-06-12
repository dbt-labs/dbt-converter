{% macro delighted_source_categorization() %}
    case
        when feedback_source ilike 'raw.fivetran_delighted_zendesk_csat%'
            then 'zendesk_csat'
        when feedback_source ilike 'raw.fivetran_delighted_thinkific_nps%'
            then 'thinkific_nps'
        when feedback_source ilike 'raw.fivetran_delighted_proserv_csat%' 
            then 'proserv_csat'
        when feedback_source ilike 'raw.fivetran_delighted%' 
            then 'dbt_cloud_nps'
    end as feedback_source,
{% endmacro %}