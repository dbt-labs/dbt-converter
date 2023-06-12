with

source as (

  select * from {{ source('snowflake_account_usage', 'users') }}
  where deleted_on is null

),

final as (

  select
    name,
    email,
    default_warehouse,
    default_role,
    default_namespace,
    owner,

    disabled as is_disabled,
    has_password,
    case
      when email is null
        then true
      else false
    end as is_service_account,

    {{ dbt.datediff(
      'created_on', 'current_timestamp()', 'hour'
    ) }} as hours_since_user_created,
    created_on,
    deleted_on,
    last_success_login

  from source

)

select * from final