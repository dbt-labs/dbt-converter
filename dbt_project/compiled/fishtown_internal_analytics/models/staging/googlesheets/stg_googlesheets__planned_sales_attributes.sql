with

source as (

    select * from raw.fivetran_googlesheets.sales_attributes
    where is_sales_attributes_included = true

),

cleaned as (

    select 

        job_id,

        
            case
                when sales_segment = 'nan'
                    then null
                else sales_segment
            end as sales_segment,
        
            case
                when sales_l_0_region = 'nan'
                    then null
                else sales_l_0_region
            end as sales_l_0_region,
        
            case
                when sales_l_1_region = 'nan'
                    then null
                else sales_l_1_region
            end as sales_l_1_region,
        
            case
                when sales_functional_role = 'nan'
                    then null
                else sales_functional_role
            end as sales_functional_role,
        
            case
                when sales_minor_level = 'nan'
                    then null
                else sales_minor_level
            end as sales_minor_level
        

    from source

)

select * from cleaned