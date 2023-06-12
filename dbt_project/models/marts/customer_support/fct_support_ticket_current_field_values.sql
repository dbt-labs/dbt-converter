{{
  config(
    materialized = "view"
  )
}}

with

ticket_histories as (

    select * from {{ ref('stg_zendesk__all_ticket_field_histories') }}
    where is_current_field_value

),

pivotted as (

    select
        ticket_id,
        {{ dbt_utils.pivot(
            'field_name',
            dbt_utils.get_column_values(ref('stg_zendesk__all_ticket_field_histories'), 'field_name'),
            agg='max',
            then_value='value',
            else_value='null',
            quote_identifiers=False
        ) }}
    from ticket_histories
    group by 1

)

select * from pivotted