{# Setup values for pivoting SFDC history to SCD2 type table #}
{%- set query -%}

    select distinct
        field,
        datatype
        
    from {{ source('salesforce', 'account_history') }}
    where field not in (
        'accountMerged',
        'accountUpdatedByLead',
        'created'
    )
    order by 1

{%- endset -%}
{%- set results = dbt_utils.get_query_results_as_dict(query) -%}
{%- set field_values = results['FIELD'] -%}
{%- set datatype_values = results['DATATYPE'] -%}

with

source as (

    select * from {{ source('salesforce', 'account_history') }}
    where field not in (
        'accountMerged',
        'accountUpdatedByLead',
        'created'
    )

),

renamed as (

    select
        accountid as account_id,
        createdbyid as created_by_id,
        id as account_history_id,

        datatype as data_type,
        field as field_name,

        isdeleted as is_deleted,
        
        newvalue__de as new_value_decimal,
        newvalue__fl as new_value_float,
        newvalue__st as new_value_string,
        newvalue__bo as new_value_boolean,

        createddate as created_at,
        createddate::date as created_date

    from source

),

pivot as (

    select
        account_id,
        created_at,
        created_date,
        
        {% for field_value in field_values -%}
            {%- set datatype_value = datatype_values[loop.index0] -%}

            case
                when field_name = '{{ field_value }}' and data_type = '{{ datatype_value }}'
                    then coalesce(
                        new_value_string,
                        new_value_float,
                        new_value_boolean,
                        new_value_decimal
                    )
                else null
            end as

            {# Correct column name when the value is a SFDC Entity ID #}
            {%- set field_column_name = dbt_utils.slugify(field_value | replace('__c', '')) -%}
            {{ field_column_name }}{% if datatype_value == 'EntityId' %}_id{% endif %}
            
            {%- if not loop.last %},{% endif %}

        {% endfor -%}

    from renamed

),

collapse_to_daily_grain as (

    select
        account_id,

        {% for field_value in field_values -%}
            {%- set datatype_value = datatype_values[loop.index0] -%}

            {%- set field_column_name = dbt_utils.slugify(field_value | replace('__c', '')) -%}
            last_value({{ field_column_name }}) ignore nulls over (
                partition by account_id, created_date
                order by created_at asc
            ) as {{ field_column_name }}{% if datatype_value == 'EntityId' %}_id{% endif %},

        {% endfor -%}
    
        created_date

    from pivot
    -- Last record per day
    qualify row_number() over (partition by account_id, created_date order by created_at asc) = 1

),

final as (

    select
        * exclude (created_date),
        created_date as valid_from,
        lead(created_date) over (partition by account_id order by created_date) as valid_to
        
    from collapse_to_daily_grain

)

select * from final
