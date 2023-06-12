-- Set Variables
{% set opportunity_types = ["Renew", "Land", "Expand"] %}

{% set product_codes = ['develop', 'read'] %}

-- Import CTEs
with

days as (

    select * from {{ ref('all_days') }}

),

opportunity_lines as (

    select * from {{ ref('fct_opportunities_line_items') }} 
),

opportunities as (

    select * from {{ ref('fct_opportunities') }}

),

-- Logical CTEs
joined as (

    select
        date_day,
        fiscal_half_year,
        is_last_day_of_fiscal_quarter,

        coalesce(
            date_day = dateadd(day, -1, current_date),
            false
        ) as is_latest_day_of_current_fiscal_quarter,
        account_id as salesforce_account_id,
        opportunity_type,
        case
            when product_code in (
                    'develop',
            --the below are legacy develop licenses
                    'enterprise_license',
                    'professional_license',
                    'vpc_license'
                )
                then 'develop'
            else product_code
        end as product_code,
        total_price,
        arr,
        mrr,
        quantity
    from days
    left join opportunity_lines
        on opportunity_lines.starts_on <= days.date_day
        and opportunity_lines.ends_on > days.date_day
    left join opportunities using (opportunity_id)
    where account_id is not null
      and days.date_day <= current_date()
      and is_closed
      and is_won

),

agg as (

    select
        date_day,
        fiscal_half_year,
        is_last_day_of_fiscal_quarter,
        is_latest_day_of_current_fiscal_quarter,
        salesforce_account_id,
        sum(arr) as total_arr,
        sum(mrr) as total_mrr,
        sum(total_price) as total_price,
        sum(
            case 
                when product_code in ('develop', 'read') then quantity 
            end 
        ) as total_allocated_seats,

        {# loop through product codes #}
        {% for product_code in product_codes %}

            -- # of seat licenses by product code 
            sum(
                case 
                    when product_code = '{{ product_code }}' 
                    then quantity
                end
            ) as total_{{ product_code }}_seats,
  
            -- arr by product code
            sum(
                case 
                    when product_code = '{{ product_code }}' 
                    then arr 
                end
            ) as total_{{ product_code }}_arr,
    
            -- mrr by product code
            sum(
                case 
                    when product_code = '{{ product_code }}' 
                    then mrr 
                end
            ) as total_{{ product_code }}_mrr,
        {% endfor %}

        {# loop through opportunity types #}
        {% for opportunity_type in opportunity_types %}

            -- arr by opportunity_type
            sum(
                case 
                    when opportunity_type = '{{ opportunity_type }}'
                    then arr 
                end
            ) as {{ opportunity_type }}_total_arr,

            -- mrr by opportunity_type
            sum(
                case 
                    when opportunity_type = '{{ opportunity_type }}' 
                    then mrr 
                end
            ) as {{ opportunity_type }}_total_mrr,

            {# nested loop through product codes #}
            {% for product_code in product_codes %}

                 -- # of seats by product_code by opportunity_type
                sum(
                    case 
                        when opportunity_type = '{{ opportunity_type }}' and product_code = '{{ product_code }}' 
                        then quantity 
                    end
                ) as {{ opportunity_type }}_{{ product_code }}_seats,

                -- mrr by product_code by opportunity_type
                sum(
                    case 
                        when opportunity_type = '{{ opportunity_type }}' and product_code = '{{ product_code }}' 
                        then mrr 
                    end
                ) as {{ opportunity_type }}_{{ product_code }}_mrr,

                -- arr by product_code by opportunity_type
                sum(
                    case 
                        when opportunity_type = '{{ opportunity_type }}' and product_code = '{{ product_code }}' 
                        then arr 
                    end
                ) as {{ opportunity_type }}_{{ product_code }}_arr

                {% if not loop.last %},{% endif %}
            {% endfor %}
            {% if not loop.last %},{% endif %}
        {% endfor %}

    from joined
    {{ dbt_utils.group_by(5) }}

),

-- final calcs
calcs as (

    select
        date_day,
        fiscal_half_year,
        is_last_day_of_fiscal_quarter,
        is_latest_day_of_current_fiscal_quarter,
        salesforce_account_id,
        total_arr,
        total_mrr,
        total_price,
        total_allocated_seats,
        total_develop_seats,
        total_read_seats,
        -- Effective Developer Rate = Total MRR / # of Developer Seat Licenses
        div0(total_mrr,total_develop_seats) as effective_developer_rate,

        -- Pure Developer Rate = Developer Seat MRR / # of Developer Seat Licenses    
        div0(total_develop_mrr,total_develop_seats) as pure_developer_rate,

        {# Iterate through each opportunity type #}
        {% for opportunity_type in opportunity_types %}
            {{ opportunity_type }}_develop_seats,
            div0({{ opportunity_type }}_total_mrr,{{ opportunity_type }}_develop_seats) as {{ opportunity_type }}_effective_developer_rate,
            div0({{ opportunity_type }}_develop_mrr,{{ opportunity_type }}_develop_seats) as {{ opportunity_type }}_pure_developer_rate
            {% if not loop.last %},{% endif %}
        {% endfor %}
    from agg
),

with_id as (

    select
       {{ dbt_utils.generate_surrogate_key([
            'date_day',
            'salesforce_account_id',
        ]) }} as id,
        *
    from calcs

)

select * from with_id