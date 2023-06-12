with 

cards as (

    select * from {{ref('stg_trello_cards')}}

),

boards as (

    select * from {{ref('stg_trello_boards')}}

),

owners as (

    select *
    from {{ref('stg_trello_card_members')}}
    where card_member_number = 0

),

members as (

    select * from {{ref('stg_trello_members')}}

),

labels as (

    select *
    from {{ref('stg_trello_card_labels')}}
    where card_label_number = 0

),

joined as (

    select

        cards.*,
        members.name as owner_name,
        boards.client,
        labels.name as label

    from cards

    join boards using (board_id)
    left join owners using (card_id)
    left join members using (member_id)
    left join labels using (card_id)

    where cards.name ilike 'sprint%'
        and cards.archived = false

),

parsed as (

    select

        card_id,
        name,
        due_date,
        owner_name,
        client,
        label,
        url,
        is_completed,

        split_part(split_part(lower(name), 'sprint #', 2), ':', 1)
            as sprint_number,

        trim(split_part(name, ':', 2)) as description,

        nullif(trim(split_part(
            split_part(lower(description), 'start date:', 2), chr(10), 1
            )),
            '') as start_date,

        nullif(trim(split_part(
            split_part(lower(description), 'end date:', 2), chr(10), 1
            )),
            '') as end_date,

        nullif(trim(split_part(
            split_part(lower(description), 'points:', 2), chr(10), 1
            )), '') as points,

        translate(nullif(trim(split_part(
            split_part(lower(description), 'cost:', 2), chr(10), 1
            )), ''), ',$', '') as cost

    from joined

),

typed as (

    select

        card_id,
        name,
        description,
        due_date,
        owner_name,
        client,
        label,
        url,
        is_completed,

        case
            when regexp_like(sprint_number, '^[0-9]+$') then sprint_number
            else null
        end::int as sprint_number,

        to_date(
            case
                when regexp_like(start_date, '\\\d{1,2}\/\\d{1,2}\/\\d{1,4}')
                    then start_date
                else null
            end
            , 'mm/dd/yyyy') as start_date,

        to_date(
            case
                when regexp_like(end_date, '\\\d{1,2}\/\\d{1,2}\/\\d{1,4}')
                    then end_date
                else null
            end
            , 'mm/dd/yyyy') as end_date,

        try_cast(points as int) as points,
        try_cast(cost as int) as cost

    from parsed

)

select * from typed
