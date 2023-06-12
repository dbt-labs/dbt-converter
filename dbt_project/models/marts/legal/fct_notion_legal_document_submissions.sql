{{ unpack_notion_databases('5fb7a075-0d64-45d9-bb62-6f3cfc6e286f') }}

final as (

    select
        notion_database_row_id as legal_document_submission_id,

        name as legal_document_name,
        atspoke_ticket,
        order_form,
        status,
        document_type,
        deal_type,
        dpa_signed_by_wefox,
        estimated_arr,

        files__media_4,

        property_5,
        property_6,

        expected_close_quarter,
        created_datetime as created_at,
        due_date,

        -- Array columns to retain desired grain of dataset
        {% for col in ['assigned_to', 'requestor', 'files__media'] -%}
            
            array_agg({{ col }}) as {{ col }}{% if not loop.last %},{% endif %}
        
        {%- endfor %}

    from unpack_json
    {{ dbt_utils.group_by(15)}}

)

select * from final