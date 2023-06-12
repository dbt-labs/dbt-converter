with

source as (

    {% set current_table = 'database_account' %}
    {% set source_relations = dbt_utils.get_relations_by_pattern(
            'fivetran_st%',
            current_table,
            database='RAW'
        )
    %}
    {% do source_relations.append(source('cloud_postgres', current_table)) %}
    {% do source_relations.append(source('cloud_postgres_emea', current_table)) %}
    {% do source_relations.append(source('cloud_postgres_au', current_table)) %}

    {{ dbt_utils.union_relations(
        relations=source_relations
    )}}

),

renamed as (

    select
        {{ postgres_database_fields() }},
        {{ id_hashing(
            original_column_name = 'id', 
            renamed_column_name = 'account_id'
        ) }},
        stripe_customer_id,

        --account info
        name,
        plan,
        {{ plan_tiering('plan') }} as plan_tier,
        run_slots,
        read_only_seats + developer_seats as total_seats,
        read_only_seats,
        developer_seats,
        billing_email_address,

        name ilike '%(Partner)%' as is_partner_training_acct,
        -- Accounts with a 5x suffix denote they are a reseller account sold by 5x
        -- these accounts are not yet paying teams accounts, and should not yet be included in Customer counts
        -- Slack thread for more context: https://dbt-labs.slack.com/archives/C0101LM7Z89/p1670560904713559
        name ilike any('%(5x)','5x Dev%') as is_reseller_acct,

        case 
        -- We know these are tripped by %test% logic so until we get a standard indicator
        -- we want to do this with as little hardcoding as possible.
            when name ilike '%greatest%'
                then false
            when name ilike '%latest%'
                then false
            when name ilike '%statestreet%'
                then false
            when name ilike '%testlio%'
                then false
        -- the original criteria
            when (name ilike '%dbt%support%' and plan = 'enterprise')
            --for single-tenant support accts
                then true
            when name ilike '%test%'
                then true
            when name ilike '%sandbox%'
                then true
            else false
        end as is_test_account,

        {{ postgres_is_deleted('state', 'is_account_deleted') }},

        case 
            when enterprise_authentication_method is not null
                then concat('auth0_', enterprise_authentication_method)
            else enterprise_authentication_method
        end as auth0_enterprise_authentication_method,

        locked as is_locked,
        lock_reason,

        --timestamps
        created_at,
        updated_at

    from source

)

select * from renamed
