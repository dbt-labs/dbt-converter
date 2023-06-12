





  

  

  

  


with vars_prefix_table as (
    
            select 'staging_prefixes' as var_name, 'stg_' as var_value
            union all
            select 'intermediate_prefixes' as var_name, 'int_' as var_value
            union all
            select 'marts_prefixes' as var_name, 'fct_' as var_value
            union all
            select 'marts_prefixes' as var_name, 'dim_' as var_value
            union all
            select 'other_prefixes' as var_name, 'rpt_' as var_value
            
),

parsed as (

select
    var_name as prefix_name, 
    

    replace(
        var_name,
        '_prefixes',
        ''
    )


 as model_type,
    var_value as prefix_value
from vars_prefix_table

),

final as (

    select
        md5(cast(coalesce(cast(model_type as TEXT), '') || '-' || coalesce(cast(prefix_value as TEXT), '') as TEXT)) as unique_id,
        *
    from parsed

)

select * from final