with

warehouse_recommendations as (

    select * from {{ ref('int_production_model_wh_recommendations_stats') }}

),

cast_to_warehouse_numeric as (

    select
        dbt_model_name,
        dbt_materialization_type,
        is_incremental_full_refresh,
        warehouse_size_numeric,
        current_object_size_in_rows,
        current_object_size_in_gigabytes,
        count_of_runs,
        average_execution_time_in_seconds,
        average_credits_used,
        average_rows_produced,
        average_gigabytes_written,
        average_gigabytes_spilled_to_local_storage,
        average_gigabytes_spilled_to_remote_storage,

        {%- set columns = [
            'warehouse_rec_by_execution_time', 'warehouse_rec_by_model_size_in_rows',
            'warehouse_rec_by_model_size_in_gigabytes', 'recommended_warehouse_size',
            'min_warehouse_size', 'median_warehouse_size', 'max_warehouse_size'
        ] -%}

        {% for column in columns %}
            case
                when {{ column }}  = 1
                    then '1 - XS'
                when {{ column }}  = 2
                    then '2 - S'
                when {{ column }}  = 3
                    then '3 - M'
                when {{ column }}  = 4
                    then '4 - L'
                when {{ column }}  = 5
                    then '5 - XL'
                when {{ column }}  = 6
                    then '6 - 2XL'
                when {{ column }}  = 7
                    then '7 - 3XL'
                when {{ column }}  = 8
                    then '8 - 4XL'
                when {{ column }}  = 9
                    then '9 - 5XL'
                when {{ column }}  = 10
                    then '10 - 6XL'
            end as {{ column }},

        {% endfor %}

        model_efficiency_ranking

    from warehouse_recommendations

),

final as (

    select
        *,

        -- Recommendations
        case
            when warehouse_size_numeric = warehouse_rec_by_execution_time
                then 'Keep as is'
            when model_efficiency_ranking in ('Poor', 'Very Poor')
                then 'Adjustment recommended'
            when warehouse_size_numeric != recommended_warehouse_size
                then 'Potential opportunity for optimization'
            else 'Keep as is'
        end as final_warehouse_recommendation


    from cast_to_warehouse_numeric

)

select * from final