with 

base_activity_types as (

    select * from {{ref('fct_customer_activity_managed')}}

),

-- If a customer has both a Land and a Churn record in the same quarter, we want to include both records 
-- so the customer count nets to 0 for this customer for the quarter. 
-- Also, Land/Churn records take precedence over any other movement activity types

lands_churns as (

    select 
        fiscal_quarter,
        fiscal_year,
        sales_channel,
        customer_id,
        customer_name,
        customer_activity_type,
        expected_arr_delta
    from base_activity_types
    where customer_activity_type in ('Land','Churn') 

),

-- For all other customer count records, we will group and listagg 
-- in order to apply the movement activity type hierarchy logic when there are multiple types

non_lands_churns as (
      
    select 
        fiscal_quarter,
        fiscal_year,
        sales_channel,
        customer_id,
        customer_name,
        count(distinct customer_activity_type) as count_types,
        {{ dbt.listagg(
            measure='DISTINCT customer_activity_type', 
            delimiter_text="'|'", 
            order_by_clause="order by customer_activity_type"
        ) }} as types,
        sum(coalesce(expected_arr_delta,0)) as sum_expected_arr_delta_excl_land_churn
    from base_activity_types
    where customer_activity_type not in ('Land','Churn') 
    {{ dbt_utils.group_by(n=5) }}

),

/*

Movement activity type hierarchy logic:
If a customer has an upsell / downsell opportunity and neither a cancel (aka churn) or land opportunity in the quarter, 
look at their net change in ARR for all opportunities in the quarter to determine where to bucket them 
(if < 0: downsell; if => 0: upsell) 

In order of importance of the type:
Land and/or Churn
Expand & Downsell
Renew
Expected Churn
Expected Downsell / Up for Expansion 
Up for Renewal
Open Pipeline

In practice:
Land and/or Churn: include either, or both, records and exclude any others for this customer
Expand & Downsell: based on sum of arr delta
Expand & anything below: Expand
Downsell & anything below: Downsell
Renew & anything below: Renew
Expected Churn & anything below: Epected Churn
Expected Downsell / Up for Expansion (& anything below): based on sum of arr delta (< 0 downsell; >= 0 expansion)
Up for Renewal and anything below: Up for Renewal
Open Pipeline: itself

*/

type_hierarchy as (

    select
        fiscal_quarter,
        fiscal_year,
        sales_channel,
        customer_id,
        customer_name,
        count_types,
        types,
        sum_expected_arr_delta_excl_land_churn,
        case 
            when types ilike ('%Expected churn%')
                then 'Expected churn'
            when types = 'Downsell|Expand'
                and sum_expected_arr_delta_excl_land_churn >= 0
                then 'Expand'
            when (types = 'Downsell|Expand' 
                or types ilike ('Downsell%'))
                then 'Downsell'
            when types ilike ('%Expand%')
                then 'Expand'
            when types ilike ('%Renew%')
                and types not like '%Up for renewal%'
                then 'Renew'
            when types ilike ('%Expansion%')
                and sum_expected_arr_delta_excl_land_churn >= 0
                then 'Up for expansion'
            when types ilike ('%Expected downsell%')
                and sum_expected_arr_delta_excl_land_churn < 0
                then 'Expected downsell'
            when types ilike ('%Up for renewal%')
                then 'Up for renewal'
            when types ilike ('%Open pipeline%')
                then 'Open pipeline'
            else types
        end as computed_types
    from non_lands_churns

),

-- Remove any non-Land and non-Churn records for customers who also have a Land and/or Churn record in the same quarter
-- as Lands/Churns take precedent

types_hierarchy_cleaned as (

    select
    type_hierarchy.*
    from type_hierarchy
    left join lands_churns
        on type_hierarchy.fiscal_quarter = lands_churns.fiscal_quarter 
        and type_hierarchy.customer_id = lands_churns.customer_id
    where 
        (type_hierarchy.fiscal_quarter is not null 
            and lands_churns.fiscal_quarter is null)
        and (type_hierarchy.customer_id is not null 
            and lands_churns.customer_id is null)

),

--  And now bring in the Land and Churn records for the customers/quarters

hierarchy_lands_churns_union as (


    select
        fiscal_quarter,
        fiscal_year,
        sales_channel,
        customer_id,
        customer_name,
        computed_types as customer_activity_type
    from types_hierarchy_cleaned

    union

    select
        fiscal_quarter,
        fiscal_year,
        sales_channel,
        customer_id,
        customer_name,
        customer_activity_type
    from lands_churns

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key([
            'fiscal_quarter',
            'customer_id',
            'customer_activity_type'
        ]) }} as customer_quarterly_activity_id_sk,
        * 
    from hierarchy_lands_churns_union

)

select * from final
