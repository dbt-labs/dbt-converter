with attendees as (

    select * from {{ ref('base_heysummit__attendees') }}

),

questions as (

    select * from {{ ref('stg_heysummit__attendee_questions') }}

),

pivoted as (
    
    select
        attendee_id,
       {{ dbt_utils.pivot(
            column='question',
            values=dbt_utils.get_column_values(ref('stg_heysummit__attendee_questions'),'question'),
            agg='min',
            then_value='answer',
            else_value='null',
            quote_identifiers=false
        ) }}

    from questions
    group by 1

),

joined as (

    select * from attendees
    left join pivoted using (attendee_id)

)

select * from joined