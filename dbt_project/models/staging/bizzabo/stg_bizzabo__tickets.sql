with 

source as (

    select * from {{ source('bizzabo', 'tickets') }}

),

renamed as (

    select
        id as ticket_id,
        eventid as event_id,

        availability,
        availabilityend as availability_end,
        
        currencycode as currency_code,
        description,
        
        
        name,
        perordermax as per_order_max,
        perordermin as per_order_min,
        price/100 as price,
        quantity,
        registrationproperties as registration_properties,
        salemethod as sale_method,
        taxrate as tax_rate,

        availabilityendtimestamp as availability_end_at,
        availabilitystarttimestamp as availability_start_at,
        _sdc_batched_at,
        case
            when _sdc_batched_at::date < (select dateadd('day',-1,max(_sdc_batched_at))::date as _sdc_batched_at_date from source) then true
            else false
        end as is_deleted

    from source

)

select * from renamed