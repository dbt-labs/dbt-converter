with source as (

    select * from {{ source('mailchimp', 'list_members') }}

),

renamed as (

  select distinct

      id as list_member_id,
      email_address as email,
      source,
      last_changed as updated_at,
      status,
      timestamp_opt as optin_at,
      unsubscribe_reason,
      tags as segments,
      first_value(t.value:name::varchar) over (
          partition by list_member_id
          order by optin_at
      ) as first_segment



   from source,
   lateral flatten (input => tags, outer => true) t

)

select * from renamed
