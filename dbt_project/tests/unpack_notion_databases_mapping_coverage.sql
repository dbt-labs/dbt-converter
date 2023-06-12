{# 
    If this test fails, mapping values need to be added to the
    notion_datatype_mapping variable in the unpack_notion_databases macro for
    each returned row.
#}

select distinct
    database_properties.value:type::string as datatype

from {{ ref('stg_notion__databases') }},
lateral flatten(input => notion_database_row) as database_properties
where datatype not in (
    'created_by', 'created_time', 'date', 'files', 'multi_select', 'number',
    'people', 'rich_text', 'select', 'title', 'url'
)
