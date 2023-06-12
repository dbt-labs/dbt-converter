with

field_history as (

    select * from {{ ref('stg_zendesk__ticket_field_history') }}

),

custom_fields as (

    select * from {{ ref('stg_zendesk__ticket_custom_fields') }}

),

field_history_cleaned as (

    select
        ticket_id::varchar as ticket_id,
        field_name,
        case 
            when field_name = 'status' 
            and value = 'solved'
                then 'closed'
            else value
        end as value,

        convert_timezone(
            'America/New_York',
            valid_starting_at
        )::timestamp_ntz as valid_starting_at,

        convert_timezone(
            'America/New_York',
            valid_ending_at
        )::timestamp_ntz as valid_ending_at

    from field_history

),

joined as (

    select 

        {{ dbt_utils.star(
            from=ref('stg_zendesk__ticket_field_history'),
            except=['FIELD_NAME', 'USER_ID'],
            relation_alias='field_history_cleaned'
        ) }},
        coalesce(
            custom_fields.field_name,
            field_history_cleaned.field_name
        ) as field_name
            
    from field_history_cleaned
    left join custom_fields
        on field_history_cleaned.field_name = custom_fields.zendesk_custom_field_id

),

with_id as (

    select
        {{dbt_utils.generate_surrogate_key([
            'ticket_id',
            'field_name',
            'valid_starting_at'
        ])}} as ticket_field_history_id,
        *,

        case
            when valid_ending_at is null
                then true
            else false
        end as is_current_field_value

    from joined

)

select * from with_id