{%- macro create_raw_secure_masked_views(
    secure_db, meta_key='masking_policy', replace_mode=false
) -%}

{%- if execute -%}

    {# Create masking policies in the target database #}
    {%- if target.user == 'dbt_cloud_user' -%}{{ dbt_snow_mask.create_masking_policy('sources')}}{%- endif -%}

    {%- for node in graph.sources.values() -%}

        {# Check create_masked_views meta key #}
        {%- set node_create_masked_views = node.source_meta.create_masked_views -%}
        {%- if node_create_masked_views == true -%}

            {# Node and target properties #}
            {%- set target_db = node.database | string -%}
            {%- set masking_policy_db = var('common_masking_policy_db', target_db) | string -%}
            {%- set node_schema = node.schema | string -%}
            {%- set target_schema = node_schema -%}
            {%- set masking_policy_schema = var('common_masking_policy_schema', target_schema) | string -%}
            {%- set name  = node.name | string -%}
            {%- set identifier = (node.identifier | default(name, True)) | string -%}
            {%- set unique_id = node.unique_id | string -%}
            {%- set node_type = node.resource_type | string -%}

            {# Build into dev db and schema when not in prod #}
            {%- if target.user != 'dbt_cloud_user' -%}

                {%- set target_db = target.database -%}  {# should be... generate db name.. maybe?#}
                {%- set target_schema = target.schema -%}  {# should be... generate schema name.. maybe?#}

            {%- endif -%}

            {# Query for existing masking policies in target #}
            {%- set masking_policy_list_sql -%}

                show masking policies in {{ masking_policy_db }}.{{ masking_policy_schema }};
                select $3||'.'||$4||'.'||$2 as masking_policy from table(result_scan(last_query_id()))

            {%- endset -%}

            {# Check configured masking policies #}
            {%- set meta_columns = dbt_snow_mask.get_meta_objects(unique_id, meta_key, node_type) -%}
            {%- if meta_columns | length > 0 -%}

                {%- set masking_policy_list = dbt_utils.get_query_results_as_dict(masking_policy_list_sql) -%}
                
            {%- endif -%}

            {# Apply masking policy(ies) #}
            {%- for meta_tuple in meta_columns if meta_columns | length > 0 -%}

                {%- set column = meta_tuple[0] -%}
                {%- set masking_policy_name  = meta_tuple[1] -%}
                {%- if masking_policy_name is not none -%}

                    {%- for masking_policy_in_db in masking_policy_list['MASKING_POLICY'] -%}

                        {%- if masking_policy_db | upper ~ '.' ~ masking_policy_schema | upper ~ '.' ~ masking_policy_name | upper == masking_policy_in_db -%}

                            {%- set set_masking_policy_query -%}

                                alter table  {{ secure_db }}.{{ node_schema }}.{{ identifier }} modify column "{{ column | upper }}"
                                set masking policy {{ masking_policy_db }}.{{ masking_policy_schema }}.{{ masking_policy_name }}
                                {%- if var('use_force_applying_masking_policy','False') | upper in ['TRUE','YES'] %} force {%- endif %}
                                
                            {%- endset -%}

                            {{ log('Running alter column query ' ~ set_masking_policy_query, info = true) }}
                            {%- if target.user == 'dbt_cloud_user' -%}{%- do run_query(set_masking_policy_query) -%}{%- endif -%}

                        {%- endif -%}

                    {%- endfor -%}

                {%- endif -%}

            {%- endfor -%}

            {# Create target schema #}
            {%- set create_schema_query -%}

                create schema if not exists {{ target_db }}.{{ target_schema }}

            {%- endset -%}

            {{ log('Running create schema query ' + create_schema_query, info = true) }}
            {%- if target.user == 'dbt_cloud_user' -%}{%- do run_query(create_schema_query) -%}{%- endif -%}

            {# Secure relation #}
            {%- set raw_secure_relation = adapter.get_relation(
                database = secure_db,
                schema = node_schema,
                identifier = identifier
            ) -%}

            {# Raise an error if dbt cannot find the relation #}
            {%- if raw_secure_relation is none -%}
                {{ exceptions.raise_compiler_error(
                    'Unable to find relation: ' ~ secure_db ~ '.' ~ node_schema ~ '.' ~ identifier
                ) }}
            {%- endif -%}

            {# Set create clause depending on arg call #}
            {%- if replace_mode -%}

                {%- set create_clause = 'create or replace view' -%}

            {%- else -%}

                {%- set create_clause = 'create view if not exists' -%}

            {%- endif -%}

            {# Create the masked views #}
            {%- set create_view_query -%}

                {{ create_clause }} {{ target_db }}.{{ target_schema }}.{{ identifier }} as (

                    select {{ dbt_utils.star(from=raw_secure_relation) }} from {{ secure_db }}.{{ node_schema }}.{{ identifier }}

                )

            {%- endset -%}

            {{ log('Running create view query ' ~ create_view_query, info = true) }}
            {%- if target.user == 'dbt_cloud_user' -%}{%- do run_query(create_view_query) -%}{%- endif -%}

        {%- endif -%}
    
    {%- endfor %}

    {# Apply masking policies to newly created views #}
    {%- if target.user == 'dbt_cloud_user' -%}{{ dbt_snow_mask.apply_masking_policy('sources')}}{%- endif -%}
{%- endif -%}

{%- endmacro -%}