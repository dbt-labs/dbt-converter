{#-

    SQL for dynamically unpacking notion databases from JSON into relational tables.
    See documentation.
    
-#}

{%- macro unpack_notion_databases(notion_database_id) -%}

    {# Notion data type to value-key mapping #}
    {%- set notion_datatype_mapping = {
        'created_by': 'created_by:name::string',
        'created_time': 'created_time::timestamp',
        'date': 'date:start::date',
        'files': 'value:file:url::string',
        'multi_select': 'value:name::string',
        'number': 'number::integer',
        'people': 'value:name::string',
        'rich_text': 'rich_text[0]:plain_text::string',
        'select': 'select:name::string',
        'title': 'title[0]:plain_text::string',
        'url': 'url::string'
    } -%}

    {# Data types stored as arrays that should be flattened #}
    {%- set notion_arrays = [
        'files', 'multi_select', 'people'
    ] -%}

    {#- Query notion database columns and notion column types -#}
    {%- set database_columns_query -%}

        select distinct
            columns.key::string as column_name,
            columns.value:type::string as column_type

        from {{ ref('stg_notion__databases') }},
        lateral flatten(input => notion_database_row) columns
        where notion_database_id = '{{ notion_database_id }}'
            and is_deleted = False

    {%- endset -%}
    {%- set database_columns_results = run_query(database_columns_query) -%}

    {%- if execute -%}

        {%- set database_columns = database_columns_results.rows -%}

    {%- endif -%}

    with

    source as (

        select * from {{ ref('stg_notion__databases') }}
        where notion_database_id = '{{ notion_database_id }}'
            and is_deleted = False

    ),

    unpack_json as (

        select
            notion_database_id,
            notion_database_row_id,

            {%- set array_columns = [] -%}
            {%- for database_column in database_columns -%}
                {%- set column_name = database_column[0] -%}
                {%- set column_type = database_column[1] -%}
                {%- set column_mapping = notion_datatype_mapping[column_type] -%}

                {#- Create a list of array columns to lateral flatten -#}
                {%- if column_type in notion_arrays -%}

                    {%- do array_columns.append((column_name, column_type)) -%}
                    flatten_{{ dbt_utils.slugify(column_name) }}.{{ column_mapping }}

                {% else %}

                    notion_database_row:"{{ column_name }}":{{ column_mapping }}

                {%- endif %}

                as {{ dbt_utils.slugify(column_name) }}{% if not loop.last %},{% endif %}

            {% endfor -%}

        from source
        
        {%- for array_column in array_columns -%}

            , lateral flatten (input => notion_database_row:"{{ array_column[0] }}":{{ array_column[1] }}, outer => true) flatten_{{ dbt_utils.slugify(array_column[0]) }}

        {% endfor -%}
        
    ),

{%- endmacro -%}