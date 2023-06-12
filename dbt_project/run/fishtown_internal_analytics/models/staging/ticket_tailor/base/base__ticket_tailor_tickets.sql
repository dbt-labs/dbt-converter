
  create or replace   view analytics_dev.dbt_jstein.base__ticket_tailor_tickets
  
   as (
    with

source as (

    select * from raw.taptickettailor.issued_tickets

),

emails as (

    select
        id,
        value:answer::varchar as email

    from source,
    lateral flatten (input=>custom_questions) as cq
    where value:question::varchar ilike '%attendee%email%'

),

renamed as (

    select
        -- keys
        source.id as ticket_id,
        ticket_type_id,
        event_id,
        order_id,
        full_name,

        lower(
            coalesce(
                emails.email,
                source.email
            )
        ) as ticket_holder_email,

        case
            when ticket_holder_email ilike any ('%fishtownanalytics%', '%dbtlabs%')
                then true
            else false
        end as is_fishtown_employee,

        split_part(ticket_holder_email, '@', -1) as domain,

        -- descriptions
        object,
        barcode,
        barcode_url,
        custom_questions,

        -- status
        status,

        -- timestamps
        to_timestamp_ntz(created_at) as created_at,
        to_timestamp_ntz(updated_at) as updated_at,
        to_timestamp_ntz(voided_at) as voided_at,

        -- metadata
        _sdc_batched_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source
    left join emails
        on source.id = emails.id

)

select * from renamed
  );

