with 

overrides as (

    select * from {{ ref('stg_googlesheets__rev_rpo_overrides') }}

),

salesforce_schedules as (

    select * from {{ ref('stg_salesforce__rev_schedules') }}

),

all_days as (

    select * from {{ ref('all_days') }}

),

enriched as (

{% set upper_bound = "dateadd(year, 10, current_date)" %}
{% set lower_bound = "'01/01/2016'" %}

    select

        salesforce_schedules.sfdc_rev_schedule_id,
        overrides.revenue_schedule_code,
        overrides.override_type,
        coalesce(overrides.override_start_date, {{ lower_bound }}) as override_start_date,
        coalesce(overrides.override_end_date, {{ upper_bound }}) as override_end_date,
        overrides.flat_amount,
        overrides.comment

    from overrides
    left join salesforce_schedules
        on overrides.revenue_schedule_code = salesforce_schedules.revenue_schedule_code

),

spined as (

    select
        all_days.date_day,
        true as is_rpo_adjusted,
        enriched.*,
        count(sfdc_rev_schedule_id) over (
            partition by sfdc_rev_schedule_id, date_day
        ) as current_applicable_overrides,
        case
            when current_applicable_overrides > 1
                then 'Override Overlap - Check Google Sheet'
            else null
        end as override_error_message,
        override_error_message is not null as is_override_error
    
    from enriched
    left join all_days
        on enriched.override_start_date <= all_days.date_day
        and enriched.override_end_date  > all_days.date_day

),

deduped as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'date_day',
            'sfdc_rev_schedule_id'
        ])}} as id,
        * 
        
    from spined
    qualify row_number() over (
        partition by sfdc_rev_schedule_id, date_day 
        order by override_start_date desc
    ) = 1

)

select * from deduped
