with transactions as (

    select * from {{ref('fct_transactions')}}

),

months as (

    select * from {{ref('all_months')}}

),

amortized as (

    select

        {{ dbt_utils.generate_surrogate_key([
            'months.date_month',
            'category',
            'invoice_id'
        ]) }} as id,
        category,
        invoice_id,
        customer_id,
        customer_id_type,
        customer_name,
        description,
        amount/periods as revenue,

        invoice_date,
        start_date,
        end_date,
        periods,
        months.date_month,

        --this logic is very painful to parse. it is creating a revenue recognition date for 
        --contracts that are amortized across multiple months. the outer case statement prevents
        --dates from being created which aren't real dates (like feb 30th), and then the 
        --inner logic concatenates the day of the month along with the month and year being
        --recognized.
        --
        --in the case of a 12-month contract that starts on 6/3/2020, 1/12 of that revenue
        --is recognized on 6/3/2020 and 1/12 of that revenue is recognized on the 3rd of the 
        --month for each successive month for 11 months.
        case 
        when category = 'hosted_snowplow' or description = 'dbt cloud enterprise' then
            case 
            when date_part(day, transactions.rev_rec_date) > 
                date_part(day, last_day(
                    to_date(date_part(year, months.date_month)::varchar || '-' ||
                        lpad(date_part(month, months.date_month)::varchar, 2, '0'), 
                        'yyyy-mm'))) 
                then last_day(months.date_month)
            else to_date(
                date_part(year, months.date_month)::varchar || '-' ||
                lpad(date_part(month, months.date_month)::varchar, 2, '0') || '-' ||
                date_part(day, transactions.rev_rec_date)::varchar, 'yyyy-mm-dd'
                )
            end
        else transactions.rev_rec_date
        end as rev_rec_date,

        is_upgrade,
        sales_motion

    from transactions

    join months
    on date_trunc('month', transactions.rev_rec_date) <= months.date_month
        and date_trunc('month', dateadd('month', periods, transactions.rev_rec_date)) > months.date_month

)

select * from amortized